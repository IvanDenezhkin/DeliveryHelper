//
//  DataStoragesListViewProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

protocol DataStoragesListViewProtocol: class {
    var presenter: DataStoragesListPresenterProtocol? { get set }
    func startLoading()
    func stopLoading()
    func updateItems(withItems: [ItemModel])
    func updateClients(withClients: [ClientModel])
    func updatePlaces(withPlaces: [PlaceModel])
}
