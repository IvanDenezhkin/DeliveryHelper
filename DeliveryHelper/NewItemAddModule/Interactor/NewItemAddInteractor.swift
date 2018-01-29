//
//  NewItemAddInteractor.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

class NewItemAddInteractor: NewItemAddInteractorProtocol {
    var dataManager: CoreDataManager?
    
    func saveNewItem(item: ItemModel) {
        dataManager?.addNewItem(item: item)
    }
}
