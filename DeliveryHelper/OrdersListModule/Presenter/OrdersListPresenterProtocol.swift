//
//  OrdersListPresenterProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 09.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation
import GoogleMaps

protocol OrdersListPresenterProtocol: class {
    var view: OrdersListViewProtocol? { get set }
    var interactor: OrdersListInteractorProtocol? { get set }
    var wireframe: OrdersListWireframeProtocol? { get set }
    
    func fetchData(forDate: Date)
    func addOrders(orders: [Order])
    func getPlaces(for orders: [OrderModel])
    func showMap(bounds: GMSCoordinateBounds?, path: GMSPath?, markers: [GMSMarker]?)
}
