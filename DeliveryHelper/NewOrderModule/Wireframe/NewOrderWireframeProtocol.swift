//
//  NewOrderWireframeProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 31.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

protocol NewOrderWireframeProtocol: class {
    static func createNewOrderModule() -> UIViewController
    func showSelectedBase(base: DataStoragesListTableViewDisplayMode, on: NewOrderViewProtocol?)
}
