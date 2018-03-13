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
        wireFrame?.dismissVC(vc: view)
    }
    
    func validateInfo(name: String, phoneNumber: String) {
        if name.count <= 3 {
            view?.showAlert(text: "Name should be more than 3 characters.")
        } else if (phoneNumber.rangeOfCharacter(from: CharacterSet.letters) != nil){
            view?.showAlert(text: "Phone number can`t have letters")
        } else if phoneNumber.count <= 7 {
            view?.showAlert(text: "Phone number should be more than 7 characters")
        } else {
            let newClient = ClientModel(withName: name, phoneNumber: phoneNumber)
            self.saveNewClient(client: newClient)
        }
    }
    
}
