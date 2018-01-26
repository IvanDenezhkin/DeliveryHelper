//
//  DataStoragesListInteractor.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 23.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

class DataStoragesListInteractor: DataStoragesListInteractorProtocol {
    var dataBase: CoreDataManager<Client>?
    weak var presenter: DataStoragesListPresenterProtocol?
    
    init(withStorage: CoreDataManager<Client>) {
        self.dataBase = withStorage
    }
    
    func fetchEntityes(forMode: DataStoragesListTableViewDisplayMode) {
        switch forMode {
        case .displayModeItem:
            if let clients = dataBase?.fetchAllEntityes() {
                presenter?.addClients(withClients: clients)
            }
        case .displayModeClient:
            if let clients = dataBase?.fetchAllEntityes() {
                presenter?.addClients(withClients: clients)
            }
        case .displayModePlace:
            if let clients = dataBase?.fetchAllEntityes() {
                presenter?.addClients(withClients: clients)
            }
        }
    }
    
    
}
