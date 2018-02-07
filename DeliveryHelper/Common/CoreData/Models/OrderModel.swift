//
//  OrderModel.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 05.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation
import CoreData

class OrderModel {
    let date: Date
    let client: NSManagedObjectID
    let place: NSManagedObjectID
    let items: [ItemModel]
    
    init(date: Date, client: NSManagedObjectID, place: NSManagedObjectID, items: [ItemModel]) {
        self.date = date
        self.client = client
        self.place = place
        self.items = items
    }
}
