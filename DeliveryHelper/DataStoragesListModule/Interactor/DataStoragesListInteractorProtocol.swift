//
//  DataStoragesListInteractorProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation
import CoreData

protocol DataStoragesListInteractorProtocol: class {
    var dataBase: CoreDataManager? { get set }
    
    func fetchEntities(forMode: DataStoragesListTableViewDisplayMode)
    func removeEntities(entityID: NSManagedObjectID)
}
