//
//  OrdersListPresenter.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 09.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

class OrdersListPresenter: OrdersListPresenterProtocol {
    weak var view: OrdersListViewProtocol?
    var interactor: OrdersListInteractorProtocol?
    
    func fetchData(forDate: Date) {
        interactor?.fetchData(forDate: forDate)
    }
    
    func addOrders(orders: [Order]) {
        let fetchedOrders = orders.map { order -> OrderModel in
            return OrderModel(date: order.dateOfDelivery!, client: (order.client?.objectID)!, place: (order.place?.objectID)!, items: order.items as! [ItemModel])
        }
        view?.addNewOrders(orders: fetchedOrders)
    }
}
