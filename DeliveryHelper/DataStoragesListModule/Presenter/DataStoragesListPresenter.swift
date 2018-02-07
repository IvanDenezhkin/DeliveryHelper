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
    weak var delegate: DataStoragesListDelegateProtocol?
    
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
            let newItem = ItemModel(withName: item.name!)
            return newItem
        }
        view?.updateItems(withItems: properItems)
    }
    
    func addClients(withClients: [Client]) {
        let properClients = withClients.map { client -> ClientModel in
            let newClient = ClientModel(withName: client.name!, phoneNumber: client.phoneNumber!)
            newClient.objectID = client.objectID
            return newClient
        }
        view?.updateClients(withClients: properClients)
    }
    
    func addPlaces(withPlaces: [Place]) {
        let properPlaces = withPlaces.map { place -> PlaceModel in
            let newPlace = PlaceModel(withCity: place.city!, street: place.street!, homeNumber: place.number!)
            newPlace.objectID = place.objectID
            return newPlace
        }
        view?.updatePlaces(withPlaces: properPlaces)
    }
}

extension DataStoragesListPresenter: DataStoragesListDelegateProtocol {
    func passItem(item: ItemModel) {
        delegate?.passItem(item: item)
        if delegate != nil { wireFrame?.dismissVC(vc: view) }
    }
    
    func passClient(client: ClientModel) {
        delegate?.passClient(client: client)
        if delegate != nil { wireFrame?.dismissVC(vc: view) }
    }
    
    func passPlace(place: PlaceModel) {
        delegate?.passPlace(place: place)
        if delegate != nil { wireFrame?.dismissVC(vc: view) }
    }
    
    
}
