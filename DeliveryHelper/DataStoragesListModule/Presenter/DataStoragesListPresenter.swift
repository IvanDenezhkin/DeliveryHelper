//
//  DataStoragesListPresenter.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

class DataStoragesListPresenter: DataStoragesListPresenterProtocol {
    
    weak var view: DataStoragesListViewProtocol?
    var interactor: DataStoragesListInteractorProtocol?
    var wireFrame: DataStoragesListWireframeProtocol?
    
    // View -> Presenter
    func fetchEntityes(forMode: DataStoragesListTableViewDisplayMode) {
        interactor?.fetchEntityes(forMode: forMode)
    }
    
    func addNewEntity(forMode: DataStoragesListTableViewDisplayMode) {
        wireFrame?.presentAddNewEntityViewController(forMode: forMode, on: view)
    }
    
    // Presenter -> View
    func addItems(withItems: [Item]) {
        let properItems = withItems.map { item -> ItemModel in
            return ItemModel(withName: item.name!)
        }
        view?.updateItems(withItems: properItems)
    }
    
    func addClients(withClients: [Client]) {
        let properClients = withClients.map { client -> ClientModel in
            return ClientModel(withName: client.name!, phoneNumber: client.phoneNumber!)
        }
        view?.updateClients(withClients: properClients)
    }
    
    func addPlaces(withPlaces: [Place]) {
        let properPlaces = withPlaces.map { place -> PlaceModel in
            return PlaceModel(withCity: place.city!, street: place.street!, homeNumber: place.number!)
        }
        view?.updatePlaces(withPlaces: properPlaces)
    }
}

