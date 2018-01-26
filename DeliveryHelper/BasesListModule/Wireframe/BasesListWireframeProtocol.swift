//
//  BasesListWireframeProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 26.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

protocol BasesListWireframeProtocol: class {
    static func createBasesListModule() -> UIViewController
    func showSelectedBase(base: DataStoragesListTableViewDisplayMode, on: BasesListViewProtocol?)
}
