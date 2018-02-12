//
//  OrdersListPresenterProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 09.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

protocol OrdersListPresenterProtocol: class {
    var view: OrdersListViewProtocol? { get set }
    var interactor: OrdersListInteractorProtocol? { get set }
    
    func fetchData(forDate: Date)
    func addOrders(orders: [Order])
}
