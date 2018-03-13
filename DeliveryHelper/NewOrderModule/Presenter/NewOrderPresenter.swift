//
//  NewOrderPresenter.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 31.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation
import CoreData

class NewOrderPresenter: NewOrderPresenterProtocol {
    weak var view: (NewOrderViewProtocol & DataStoragesListDelegateProtocol)?
    var interactor: NewOrderInteractorProtocol?
    var wireframe: NewOrderWireframeProtocol?
    
    func showItems() {
        wireframe?.showSelectedBase(base: .displayModeItem, on: view)
    }
    
    func showClients() {
        wireframe?.showSelectedBase(base: .displayModeClient, on: view)
    }
    
    func showPlaces() {
        wireframe?.showSelectedBase(base: .displayModePlace, on: view)
    }
    
    func saveOrder(order: OrderModel) {
        interactor?.saveOrder(order: order)
    }
    
    func validateDate(date: Date, client: NSManagedObjectID?, place: NSManagedObjectID?, items: [ItemModel]) {
        if items.count == 0 {
            view?.showAlert(text: "Select item, please")
            return
        }
        guard let unwrappedClient = client else {
            view?.showAlert(text: "Select client, please")
            return
        }
        
        guard let unwrappedPlace = place else {
            view?.showAlert(text: "Select place, please")
            return
        }
        let order = OrderModel(date: date, client: unwrappedClient, place: unwrappedPlace, items: items)
        saveOrder(order: order)
        view?.clearData()
    }
    
}
