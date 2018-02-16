//
//  OrdersListInteractorProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 09.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

protocol OrdersListInteractorProtocol {
    var presenter: OrdersListPresenterProtocol? { get set }
    func fetchData(forDate: Date)
    func getPlaces(for orders: [OrderModel])
}
