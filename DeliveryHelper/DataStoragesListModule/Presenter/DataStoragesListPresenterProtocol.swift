//
//  DataStoragesListPresenterProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

protocol DataStoragesListPresenterProtocol: class {
    var view: DataStoragesListViewProtocol? { get set }
    var wireFrame: DataStoragesListWireframeProtocol? { get set }
    var interactor: DataStoragesListInteractorProtocol? { get set }
    
    func addNewEntity(forMode: DataStoragesListTableViewDisplayMode)
    func fetchEntityes(forMode: DataStoragesListTableViewDisplayMode)
    
    func addItems(withItems: [ItemModel])
    func addClients(withClients: [Client])
    func addPlaces(withPlaces: [PlaceModel])
}
