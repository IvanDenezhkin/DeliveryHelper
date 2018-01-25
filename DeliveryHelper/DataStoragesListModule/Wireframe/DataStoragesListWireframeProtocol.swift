//
//  DataStoragesListWireframeProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

protocol DataStoragesListWireframeProtocol: class {
    static func createDataStoragesListModule(withDisplayMode: DataStoragesListTableViewDisplayMode) -> UIViewController
    func presentAddNewEntityViewController(forMode: DataStoragesListTableViewDisplayMode, on: DataStoragesListViewProtocol?)
}
