//
//  NewItemAddPresenter.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

class NewItemAddPresenter: NewItemAddPresenterProtocol {
    var view: NewItemAddViewProtocol?
    var interactor: NewItemAddInteractorProtocol?
    var wireFrame: NewItemAddWireframeProtocol?
    
    func saveNewItem(item: ItemModel) {
        interactor?.saveNewItem(item: item)
        wireFrame?.dismissVC(vc: view)
    }
    
    func check(name: String) {
        if name.count <= 3 {
            view?.showAlert(text: "Name should be more than 3 characters.")
        } else {
            let item = ItemModel(withName: name)
            saveNewItem(item: item)
        }
    }
}
