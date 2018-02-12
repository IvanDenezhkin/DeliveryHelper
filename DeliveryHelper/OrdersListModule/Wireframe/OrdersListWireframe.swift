//
//  OrdersListWireframe.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 09.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

class OrdersListWireframe: OrdersListWireframeProtocol {
    static func createOrdersListModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "OrdersList", bundle: nil)
        let orederListVC = storyboard.instantiateViewController(withIdentifier: "OrdersListViewController") as! OrdersListViewController
        let presenter = OrdersListPresenter()
        let interactor = OrdersListInteractor()

        orederListVC.presenter = presenter
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.dataBase = CoreDataManager.shared
        presenter.view = orederListVC
        
        let navigationController = UINavigationController(rootViewController: orederListVC)
        return navigationController
    }
    
    
}
