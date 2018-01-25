//
//  PlaceModel.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

class PlaceModel {
    let city: String
    let street: String
    let homeNumber: String
    
    init(withCity city: String, street: String, homeNumber: String) {
        self.city = city
        self.street = street
        self.homeNumber = homeNumber
    }
}