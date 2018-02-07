//
//  ClientModel.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 24.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation
import CoreData

class ClientModel {
    let name: String
    let phoneNumber: String
    var objectID: NSManagedObjectID?
    
    init(withName name: String, phoneNumber phone: String) {
        self.name = name
        self.phoneNumber = phone
    }
}
