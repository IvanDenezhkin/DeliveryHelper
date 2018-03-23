//
//  OrdersListWireframe.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 09.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit
import GoogleMaps

class OrdersListWireframe: OrdersListWireframeProtocol {
    static func createOrdersListModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "OrdersList", bundle: nil)
        let orederListVC = storyboard.instantiateViewController(withIdentifier: "OrdersListViewController") as! OrdersListViewController
        let presenter = OrdersListPresenter()
        let interactor = OrdersListInteractor()
        let wireframe = OrdersListWireframe()
        
        orederListVC.presenter = presenter
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.presenter = presenter
        interactor.dataBase = CoreDataManager.shared
        presenter.view = orederListVC
        
        return orederListVC
    }
    
    func showAddNewOrderModule(on: UIViewController) {
        let addVC = NewOrderWireframe.createNewOrderModule()
        on.present(addVC, animated: true, completion: nil)
    }
    
    func showMap(bounds: GMSCoordinateBounds?, path: GMSPath?, markers: [GMSMarker]?, on view: OrdersListViewProtocol?) {
            guard let controller = view as? UIViewController else { return }
            let storyboard = UIStoryboard(name: "OrdersList", bundle: nil)
            let mapVC = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
            mapVC.bounds = bounds
            mapVC.path = path
            mapVC.markers = markers
            controller.present(mapVC, animated: true, completion: nil)
    }
    
    
}
