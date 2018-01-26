//
//  BasesListWireframe.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 26.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

class BasesListWireframe: BasesListWireframeProtocol {

    static func createBasesListModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "BasesList", bundle: nil)
        let newbasesVC = storyboard.instantiateViewController(withIdentifier: "BasesListViewController") as! BasesListViewController
        let presenter = BasesListPresenter()
        let wireframe = BasesListWireframe()
        
        newbasesVC.presenter = presenter
        presenter.wireframe = wireframe
        presenter.view = newbasesVC

        let navigationController = UINavigationController(rootViewController: newbasesVC)
        return navigationController
    }
    
    func showSelectedBase(base: DataStoragesListTableViewDisplayMode, on: BasesListViewProtocol?) {
        if let controller = on as? UIViewController {
            controller.navigationController?.pushViewController(DataStoragesListWireframe.createDataStoragesListModule(withDisplayMode: base), animated: true)
        }
    }
    
    
}
