//
//  NewItemAddInteractorProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

protocol NewItemAddInteractorProtocol {
    var dataManager: CoreDataManager? { get set }
    func saveNewClient(item: ItemModel)
}
