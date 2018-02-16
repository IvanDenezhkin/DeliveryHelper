//
//  OrdersListWireframeProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 09.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit
import GoogleMaps

protocol OrdersListWireframeProtocol: class {
    static func createOrdersListModule() -> UIViewController
    func showMap(bounds: GMSCoordinateBounds?, path: GMSPath?, markers: [GMSMarker]?, on: OrdersListViewProtocol?)
}
