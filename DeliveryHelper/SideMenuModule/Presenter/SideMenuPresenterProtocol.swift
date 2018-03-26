//
//  SideMenuPresenterProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 26.03.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

protocol SideMenuPresenterProtocol {
    var menuView: UIViewController? { get set }
    var mainView: UIViewController? { get set }
    func showDataStorageList(with: DataStoragesListTableViewDisplayMode)
}
