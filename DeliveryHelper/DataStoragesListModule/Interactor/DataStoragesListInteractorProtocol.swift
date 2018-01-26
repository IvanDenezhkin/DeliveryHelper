//
//  DataStoragesListInteractorProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

protocol DataStoragesListInteractorProtocol: class {
    var dataBase: CoreDataManager<Client>? { get set }
    
    func fetchEntityes(forMode: DataStoragesListTableViewDisplayMode)
}
