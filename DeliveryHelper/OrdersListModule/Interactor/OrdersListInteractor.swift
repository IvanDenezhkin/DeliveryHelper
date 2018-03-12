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
        let orders = dataBase?.fetchAllEntities(forType: Order.self, date: forDate)
        presenter?.addOrders(orders: orders!)
    }
    
    func getPlaces(for orders: [OrderModel]) {
        var places = orders.map { order -> CLLocationCoordinate2D in
            let place = dataBase?.context.object(with: order.place) as! Place
            return CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
        }
        
        let locationManager = CLLocationManager()
        if let userLocation = locationManager.location {
            places.insert(userLocation.coordinate, at: 0)
        }
        
        NetworkManager.getRoute(withCoordinates: places) { mapData, error in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                self.presenter?.showMap(bounds: mapData?.mapConfig, path: mapData?.path, markers: mapData?.markers)
            }
        }
    }
}
