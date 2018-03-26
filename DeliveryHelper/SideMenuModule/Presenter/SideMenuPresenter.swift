//
//  SideMenuPresenter.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 26.03.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuPresenter: SideMenuPresenterProtocol {
    var mainView: UIViewController?
    weak var menuView: UIViewController?
    
    func showDataStorageList(with mode: DataStoragesListTableViewDisplayMode) {
        guard let menu = menuView else { return }
        guard let viewController = mainView else { return }
        menu.dismiss(animated: true) {
            let listVC = DataStoragesListWireframe.createDataStoragesListModule(withDisplayMode: mode)
            listVC.modalTransitionStyle = .crossDissolve
            viewController.present(listVC, animated: true, completion: nil)
        }
    }
}
