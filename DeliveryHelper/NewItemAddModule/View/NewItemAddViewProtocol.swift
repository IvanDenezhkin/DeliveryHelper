//
//  NewItemAddViewProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

protocol NewItemAddViewProtocol: class {
    var presenter: NewItemAddPresenterProtocol? { get set }
    func showAlert(text: String)
}
