//
//  NewClientAddPresenter.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 24.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

class NewClientAddPresenter: NewClientAddPresenterProtocol {
    weak var view: NewClientAddViewProtocol?
    var wireFrame: NewClientAddWireframeProtocol?
    var interactor: NewClientAddInteractorProtocol?
    
    
    func saveNewClient(client: ClientModel) {
        interactor?.saveNewClient(client: client)
    }
    
    func dismissVC() {
       wireFrame?.dismissVC(vc: view)
    }
}
