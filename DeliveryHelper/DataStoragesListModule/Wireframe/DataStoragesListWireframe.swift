//
//  DataStoragesListWireframe.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 23.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

class DataStoragesListWireframe: DataStoragesListWireframeProtocol {
    
    static func createDataStoragesListModule(withDisplayMode: DataStoragesListTableViewDisplayMode) -> UIViewController {
        let dataStoragesListVC = UIStoryboard(name: "DataStoragesListView", bundle: nil).instantiateViewController(withIdentifier: "DataStoragesListTableViewController") as! DataStoragesListTableViewController
        let presenter = DataStoragesListPresenter()
        let interactor = DataStoragesListInteractor(withStorage: CoreDataManager<Client>())
        let wireFrame = DataStoragesListWireframe()
        dataStoragesListVC.presenter = presenter
        dataStoragesListVC.state = withDisplayMode
        presenter.view = dataStoragesListVC
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        interactor.presenter = presenter
        
        return dataStoragesListVC
    }
    
    func presentAddNewEntityViewController(forMode: DataStoragesListTableViewDisplayMode, on: DataStoragesListViewProtocol?) {
        if let sourceVC = on as? UIViewController {
            switch forMode {
            case .displayModeItem:
                sourceVC.navigationController?.pushViewController(NewItemAddWireframe.createNewItemAddModule(), animated: true)
            case .displayModeClient:
                sourceVC.navigationController?.pushViewController(NewClientAddWireframe.createNewClientAddModule(), animated: true)
            case .displayModePlace:
                sourceVC.navigationController?.pushViewController(NewPlaceAddWireframe.createNewPlaceAddModule(), animated: true)
            }
        }
    }
    
    
}
