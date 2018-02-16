//
//  OrdersListInteractor.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 09.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation
import CoreLocation

class OrdersListInteractor: OrdersListInteractorProtocol {
    weak var presenter: OrdersListPresenterProtocol?
    var dataBase: CoreDataManager?
    
    func fetchData(forDate: Date) {
        let orders = dataBase?.fetchAllEntityes(forType: Order.self, date: forDate)
        presenter?.addOrders(orders: orders!)
    }
    
    func getPlaces(for orders: [OrderModel]) {
        let places = orders.map { order -> CLLocationCoordinate2D in
            let place = dataBase?.context.object(with: order.place) as! Place
            return CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
        }
        
        NetworkManager.getRouse(withCoordinates: places) { bounds, path, markers in
            self.presenter?.showMap(bounds: bounds, path: path, markers: markers)
        }
    }
    
}
