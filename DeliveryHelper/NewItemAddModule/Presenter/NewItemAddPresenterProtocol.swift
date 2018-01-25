//
//  NewItemAddPresenterProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

protocol NewItemAddPresenterProtocol: class {
    var view: NewItemAddViewProtocol? { get set }
    var interactor: NewItemAddInteractorProtocol? { get set }
    var wireFrame: NewItemAddWireframeProtocol? { get set }
    func saveNewItem(item: ItemModel)
}
