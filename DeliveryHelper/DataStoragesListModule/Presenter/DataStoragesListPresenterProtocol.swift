//
//  DataStoragesListPresenterProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation
import CoreData

protocol DataStoragesListPresenterProtocol: class {
    var view: DataStoragesListViewProtocol? { get set }
    var wireFrame: DataStoragesListWireframeProtocol? { get set }
    var interactor: DataStoragesListInteractorProtocol? { get set }
    var delegate: DataStoragesListDelegateProtocol? { get set }
    
    func addNewEntity(forMode: DataStoragesListTableViewDisplayMode)
    func fetchEntities(forMode: DataStoragesListTableViewDisplayMode)
    func removeEntity(entityID: NSManagedObjectID)
    
    func addItems(withItems: [Item])
    func addClients(withClients: [Client])
    func addPlaces(withPlaces: [Place])
}
