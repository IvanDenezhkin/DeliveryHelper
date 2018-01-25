//
//  NewClientAddPresenterProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 24.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

protocol NewClientAddPresenterProtocol {
    var view: NewClientAddViewProtocol? { get set }
    var interactor: NewClientAddInteractorProtocol? { get set }
    var wireFrame: NewClientAddWireframeProtocol? { get set }
    
    func saveNewClient(client:ClientModel)
    func dismissVC()
}
