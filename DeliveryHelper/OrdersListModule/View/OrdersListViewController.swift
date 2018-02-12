//
//  OrdersListViewController.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 09.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

class OrdersListViewController: UITableViewController, OrdersListViewProtocol {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var presenter: OrdersListPresenterProtocol?
    var selectedDate = Date()
    var orders: [OrderModel] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.headerView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.fetchData(forDate: self.selectedDate)
    }
    
    @objc func handleTap() {
        UIView.animate(withDuration: 1.5) {
            self.headerView.frame.size.height = 200
            self.tableView.tableHeaderView = self.headerView
            self.headerView.backgroundColor = .blue
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func addNewOrders(orders: [OrderModel]) {
        self.orders = orders
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let order = orders[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell") as! OrderTableViewCell
        cell.detailsLabel.text = "\(order.date.userPreferedDateString) + \(String(describing: order.items.first))"
        return cell
    }
}
