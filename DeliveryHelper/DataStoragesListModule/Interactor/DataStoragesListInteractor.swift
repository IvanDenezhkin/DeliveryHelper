//
//  DataStoragesListInteractor.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 23.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

class DataStoragesListInteractor: DataStoragesListInteractorProtocol {
    var dataBase: CoreDataManager?
    weak var presenter: DataStoragesListPresenterProtocol?
        
    func fetchEntityes(forMode: DataStoragesListTableViewDisplayMode) {
        switch forMode {
        case .displayModeItem:
            if let items = dataBase?.fetchAllEntityes(forType: Item.self) {
                presenter?.addItems(withItems: items)
            }
        case .displayModeClient:
            if let clients = dataBase?.fetchAllEntityes(forType: Client.self) {
                presenter?.addClients(withClients: clients)
            }
        case .displayModePlace:
            if let places = dataBase?.fetchAllEntityes(forType: Place.self) {
                presenter?.addPlaces(withPlaces: places)
            }
        }
    }
    
    
}
