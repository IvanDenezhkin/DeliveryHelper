//
//  DataStoragesListInteractor.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 23.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation
import CoreData

class DataStoragesListInteractor: DataStoragesListInteractorProtocol {
    var dataBase: CoreDataManager?
    weak var presenter: DataStoragesListPresenterProtocol?
        
    func fetchEntities(forMode: DataStoragesListTableViewDisplayMode) {
        switch forMode {
        case .displayModeItem:
            if let items = dataBase?.fetchAllEntities(forType: Item.self) {
                presenter?.addItems(withItems: items)
            }
        case .displayModeClient:
            if let clients = dataBase?.fetchAllEntities(forType: Client.self) {
                presenter?.addClients(withClients: clients)
            }
        case .displayModePlace:
            if let places = dataBase?.fetchAllEntities(forType: Place.self) {
                presenter?.addPlaces(withPlaces: places)
            }
        }
    }
    
    func removeEntities(entityID: NSManagedObjectID) {
        dataBase?.removeEntity(withID: entityID)
    }
}
