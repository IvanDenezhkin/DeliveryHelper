//
//  NewClientAddInteractor.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 24.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

class NewClientAddInteractor: NewClientAddInteractorProtocol {
    var dataManager: CoreDataManager?
    
    func saveNewClient(client: ClientModel) {
        let DB = CoreDataManager.shared
        DB.addNewClient(client: client)
    }
}
