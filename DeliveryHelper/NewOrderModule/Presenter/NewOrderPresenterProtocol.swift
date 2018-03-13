//
//  NewOrderPresenterProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 31.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation
import CoreData

protocol NewOrderPresenterProtocol: class {
    func showItems()
    func showClients()
    func showPlaces()
    func saveOrder(order: OrderModel)
    func validateDate(date: Date, client: NSManagedObjectID?, place: NSManagedObjectID?, items: [ItemModel])
}
