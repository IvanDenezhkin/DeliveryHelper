//
//  NewOrderWireframe.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 31.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

class NewOrderWireframe: NewOrderWireframeProtocol {
    static func createNewOrderModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "NewOrder", bundle: nil)
        let newOrderVC = storyboard.instantiateViewController(withIdentifier: "NewOrderViewController") as! NewOrderViewController
        let presenter = NewOrderPresenter()
        let interactor = NewOrderInteractor()
        let wireframe = NewOrderWireframe()
        
        newOrderVC.presenter = presenter
        
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        presenter.view = newOrderVC
        
        let navigationController = UINavigationController(rootViewController: newOrderVC)
        return navigationController
    }
    
    func showSelectedBase(base: DataStoragesListTableViewDisplayMode, on: NewOrderViewProtocol?) {
        if let controller = on as? NewOrderViewController {
            
            if let destinationVC = DataStoragesListWireframe.createDataStoragesListModule(withDisplayMode: base) as? DataStoragesListTableViewController {
                destinationVC.presenter?.delegate = controller
                controller.navigationController?.pushViewController(destinationVC, animated: true)
            }
        }
    }
}
