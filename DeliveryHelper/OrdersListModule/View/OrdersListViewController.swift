//
//  OrdersListViewController.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 09.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit
import FSCalendar

class OrdersListViewController: UIViewController, OrdersListViewProtocol {
    @IBOutlet weak var topTriangleView: UIView!
    @IBOutlet weak var bottomTriangleView: UIView!
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var ordersCountLabel: UILabel!
    @IBOutlet weak var rightPanelView: UIView!
    @IBOutlet weak var routeButton: UIButton!
    
    
    var presenter: OrdersListPresenterProtocol?
    var selectedDate: Date! {
        didSet {
            presenter?.fetchData(forDate: selectedDate)
        }
    }
    
    var isRightPanelHiden = false
    var orders: [OrderModel] = []
    let gradientColors = [UIColor.lowBlack.cgColor , UIColor.highBlack.cgColor]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTopTriangleShape()
        addBottomTriangleShape()
        
        calendarView.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        calendarView.select(selectedDate, scrollToDate: true)
        calendarView.clipsToBounds = true
        ordersCountLabel.layer.cornerRadius = ordersCountLabel.layer.frame.height / 2
        ordersCountLabel.layer.masksToBounds = true
        rightPanelView.layer.cornerRadius = 10
        rightPanelView.layer.masksToBounds = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        selectedDate = Date().startOfDay
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func addTopTriangleShape() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.colors = gradientColors
        gradientLayer.frame = topTriangleView.bounds
        
        let mask = CAShapeLayer()
        mask.frame = topTriangleView.layer.bounds
        
        let width = topTriangleView.layer.frame.size.width
        let height = topTriangleView.layer.frame.size.height
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: (height / 3) * 2))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        mask.path = path
        
        gradientLayer.mask = mask
        topTriangleView.layer.mask = mask
        topTriangleView.layer.addSublayer(gradientLayer)
        topTriangleView.bringSubview(toFront: self.calendarView)
        topTriangleView.bringSubview(toFront: self.ordersCountLabel)
        
        // add a shadow below triangle layer
        let shadowLayer = CALayer()
        shadowLayer.frame = topTriangleView.bounds
        shadowLayer.shadowRadius = 5
        shadowLayer.shadowOpacity = 1
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOffset = CGSize(width: 5, height: 5)
        shadowLayer.shadowPath = path
        view.layer.insertSublayer(shadowLayer, below: topTriangleView.layer)
    }
    
    private func addBottomTriangleShape() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.colors = gradientColors
        gradientLayer.frame = bottomTriangleView.bounds
        
        let mask = CAShapeLayer()
        mask.frame = bottomTriangleView.layer.bounds
        
        let width = bottomTriangleView.layer.frame.size.width
        let height = bottomTriangleView.layer.frame.size.height
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: height / 1.5))
        path.addLine(to: CGPoint(x: 0, y: height))
        mask.path = path
        
        gradientLayer.mask = mask
        bottomTriangleView.layer.mask = mask
        bottomTriangleView.layer.addSublayer(gradientLayer)
        
        // add a shadow below triangle layer
        let shadowLayer = CALayer()
        shadowLayer.frame = CGRect(x: 0, y: view.frame.height - bottomTriangleView.frame.height, width: bottomTriangleView.frame.width, height: bottomTriangleView.frame.height)
        shadowLayer.shadowRadius = 5
        shadowLayer.shadowOpacity = 1
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOffset = CGSize(width: 5, height: -5)
        shadowLayer.shadowPath = path
        view.layer.insertSublayer(shadowLayer, below: bottomTriangleView.layer)
    }
    
    func addNewOrders(orders: [OrderModel]) {
        self.orders = orders
        if orders.count != 0 {
            self.ordersCountLabel.text = "\(orders.count)"
            ordersCountLabel.isHidden = false
            showRightPanelAndRouteButton()
        } else {
            ordersCountLabel.isHidden = true
            hideRightPanelAndRouteButton()
        }
        collectionView.reloadData()
    }
    
    @objc @IBAction func addNewOrderButtonPressed(_ sender: UIButton) {
        presenter?.showAddNewOrderModule()
    }
    
    @IBAction func routeButtonPressed(_ sender: UIButton) {
        presenter?.getRoute(for: orders)
    }
    
    
    func hideRightPanelAndRouteButton() {
        if isRightPanelHiden { return }
        isRightPanelHiden = true
        UIView.animate(withDuration: 0.5) {
            self.rightPanelView.frame.origin.x += self.rightPanelView.frame.width
            self.routeButton.alpha = 0
        }
    }
    
    func showRightPanelAndRouteButton() {
        if !isRightPanelHiden { return }
        isRightPanelHiden = false
        UIView.animate(withDuration: 0.5) {
            self.rightPanelView.frame.origin.x -= self.rightPanelView.frame.width
            self.routeButton.alpha = 1
        }
    }
}

extension OrdersListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orders.count == 0 ? 1 : orders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrderCell", for: indexPath) as! OrderCell
        if orders.count != 0 {
            cell.order = orders[indexPath.row]
            cell.addOrderButton.isHidden = true
            cell.textLabel.isHidden = false
            ordersCountLabel.isHidden = false
            cell.textLabel.transform = CGAffineTransform(rotationAngle: CGFloat(-16.5 * .pi/180))
            return cell
        } else {
            cell.textLabel.isHidden = true
            cell.addOrderButton.isHidden = false
            cell.addOrderButton.addTarget(self, action: #selector(addNewOrderButtonPressed), for: .touchUpInside)
            ordersCountLabel.isHidden = true
            return cell
        }
    }
}

extension OrdersListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension OrdersListViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.selectedDate = date.startOfDay
    }
}

