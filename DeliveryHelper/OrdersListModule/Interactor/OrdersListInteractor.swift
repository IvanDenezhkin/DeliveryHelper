//
//  OrdersListInteractor.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 09.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

class OrdersListInteractor: OrdersListInteractorProtocol {
    weak var presenter: OrdersListPresenterProtocol?
    var dataBase: CoreDataManager?
    
    func fetchData(forDate: Date) {
        let orders = dataBase?.fetchAllEntityes(forType: Order.self, date: forDate)
        presenter?.addOrders(orders: orders!)
    }
    
    
}
