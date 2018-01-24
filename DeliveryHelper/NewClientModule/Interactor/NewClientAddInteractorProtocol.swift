//
//  NewClientAddInteractorProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 24.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

protocol NewClientAddInteractorProtocol {
    var dataManager: CoreDataManager? { get set }
    func saveNewClient(client: ClientModel)
}
