//
//  NewOrderPresenter.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 31.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

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
}
