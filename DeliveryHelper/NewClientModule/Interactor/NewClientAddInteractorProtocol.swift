//
//  NewClientAddInteractorProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 24.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

protocol NewClientAddInteractorProtocol: class {
    var dataManager: CoreDataManager<Client>? { get set }
    func saveNewClient(client: ClientModel)
}
