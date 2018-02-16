//
//  OrdersListPresenter.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 09.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation
import GoogleMaps

class OrdersListPresenter: OrdersListPresenterProtocol {

    
    weak var view: OrdersListViewProtocol?
    var interactor: OrdersListInteractorProtocol?
    var wireframe: OrdersListWireframeProtocol?
    
    func fetchData(forDate: Date) {
        interactor?.fetchData(forDate: forDate)
    }
    
    func getPlaces(for orders: [OrderModel]) {
        interactor?.getPlaces(for: orders)
    }
    
    func addOrders(orders: [Order]) {
        let fetchedOrders = orders.map { order -> OrderModel in
            return OrderModel(date: order.dateOfDelivery!, client: (order.client?.objectID)!, place: (order.place?.objectID)!, items: order.items as! [ItemModel])
        }
        view?.addNewOrders(orders: fetchedOrders)
    }
    
    func showMap(bounds: GMSCoordinateBounds?, path: GMSPath?, markers: [GMSMarker]?) {
        wireframe?.showMap(bounds: bounds, path: path, markers: markers, on: view)
    }
}
