//
//  BasesListPresenterProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 26.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

protocol BasesListPresenterProtocol: class {
    var view: BasesListViewProtocol? { get set }
    var wireframe: BasesListWireframeProtocol? { get set }
    
    func showSelectedBase(base: DataStoragesListTableViewDisplayMode)
}
