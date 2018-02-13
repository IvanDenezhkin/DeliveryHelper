//
//  PlaceModel.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation
import CoreData

class PlaceModel {
    let adress: String
    let latitude: Double
    let longitude: Double
    var objectID: NSManagedObjectID?
    
    init(adress: String, latitude: Double, longitude: Double) {
        self.adress = adress
        self.latitude = latitude
        self.longitude = longitude
    }
}
