//
//  OrdersListViewController.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 09.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit
import JTAppleCalendar

class OrdersListViewController: UITableViewController, OrdersListViewProtocol {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var presenter: OrdersListPresenterProtocol?
    var selectedDate = Date().startOfDay
    let collectiveView = UIView()
    var orders: [OrderModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectiveView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        tableView.tableHeaderView = collectiveView
        collectiveView.addSubview(calendarView)
        collectiveView.addSubview(headerView)
        
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.topAnchor.constraint(equalTo: collectiveView.topAnchor).isActive = true
        calendarView.leadingAnchor.constraint(equalTo: collectiveView.leadingAnchor).isActive = true
        calendarView.trailingAnchor.constraint(equalTo: collectiveView.trailingAnchor).isActive = true
        calendarView.bottomAnchor.constraint(equalTo: collectiveView.bottomAnchor).isActive = true
        calendarView.alpha = 0
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showCalendar))
        self.headerView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.fetchData(forDate: self.selectedDate)
    }
    
    @objc func showCalendar() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.collectiveView.frame.size.height = 300
            self.collectiveView.layoutIfNeeded()
            self.headerView.alpha = 0.2
            self.tableView.tableHeaderView = self.collectiveView
        }) { _ in
            UIView.animate(withDuration: 0.2, animations: {
                self.headerView.alpha = 0
                self.calendarView.backgroundColor = .orange
                self.calendarView.alpha = 1
                self.calendarView.scrollToDate(self.selectedDate)
            })
        }
    }
    
    func removeCalendarView() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.collectiveView.layoutIfNeeded()
            self.calendarView.alpha = 0
        }) { _ in
            UIView.animate(withDuration: 0.2, animations: {
                self.collectiveView.frame.size.height = 50
                self.tableView.tableHeaderView = self.collectiveView
                self.headerView.alpha = 1
            })
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if orders.count > 0 {
            return orders.count + 1
        } else {
            return orders.count
        }
    }
    
    func addNewOrders(orders: [OrderModel]) {
        self.orders = orders
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == orders.count {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "ButtonCell")
            let button = UIButton()
            button.addTarget(self, action: #selector(showMap), for: .touchUpInside)
            button.setTitle("Show Route", for: .normal)
            button.setTitleColor(.blue, for: .normal)
            cell.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
            button.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
            return cell
        } else {
            let order = orders[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell") as! OrderTableViewCell
            cell.detailsLabel.text = "\(order.date.userPreferedDateString) + \(String(describing: order.items.first))"
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            self.orders.remove(at: indexPath.row)
            if self.orders.count > 0 {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            } else {
                tableView.reloadData()
            }
        }
        return [deleteAction]
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row == orders.count { return false }
        return true
    }
    
    @objc func showMap() {
        presenter?.getPlaces(for: orders)
    }
}

extension OrdersListViewController: JTAppleCalendarViewDataSource {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        return ConfigurationParameters(startDate: Date.startOfCurrentYear, endDate: Date.endOfCurrentYear, firstDayOfWeek: .monday)
    }
}

extension OrdersListViewController: JTAppleCalendarViewDelegate {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
    }
    
    func calendar(_ calendar: JTAppleCalendarView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTAppleCollectionReusableView {
        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: "CalendarHeaderView", for: indexPath) as! CalendarHeaderView
        return  header
    }
    
    func calendarSizeForMonths(_ calendar: JTAppleCalendarView?) -> MonthSize? {
        return MonthSize(defaultSize: 50)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        cell.dateLabel.text = cellState.text
        if cellState.dateBelongsTo == .thisMonth {
            cell.dateLabel.textColor = .white
        } else {
            cell.dateLabel.textColor = .gray
        }
        
        if cellState.date == selectedDate {
            cell.selectionView.isHidden = false
        }
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        guard let firstDay = visibleDates.monthDates.first?.date else { return }
        setHeader(forDate: firstDay)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        self.selectedDate = date
        navigationItem.title = date.userPreferedDateString
        presenter?.fetchData(forDate: date)
        removeCalendarView()
    }
    
    func setHeader(forDate: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        navigationItem.title = formatter.string(from: forDate)
    }
}

