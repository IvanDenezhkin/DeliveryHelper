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
  
}
