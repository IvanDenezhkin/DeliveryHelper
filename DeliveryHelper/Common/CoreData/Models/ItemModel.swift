//
//  ItemModel.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation
import CoreData

class ItemModel: NSObject, NSCoding {

    
    let name: String?
    var quantity: Int?
    
    init(withName name: String) {
        self.name = name
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "ItemModelNameKey")
        aCoder.encode(self.quantity, forKey: "ItemModelQuantityKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "ItemModelNameKey") as? String
        self.quantity = aDecoder.decodeObject(forKey: "ItemModelQuantityKey") as? Int
    }
}
