//
//  OrdersListViewProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 09.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

protocol OrdersListViewProtocol: class {
    var presenter: OrdersListPresenterProtocol? { get set }
    func addNewOrders(orders: [OrderModel])
}
