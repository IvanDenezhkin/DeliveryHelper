//
//  BasesListPresenter.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 26.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

class BasesListPresenter: BasesListPresenterProtocol {
    weak var view: BasesListViewProtocol?
    var wireframe: BasesListWireframeProtocol?
    
    func showSelectedBase(base: DataStoragesListTableViewDisplayMode) {
        wireframe?.showSelectedBase(base: base, on: view)
    }
    
    
}
