//
//  NewClientAddWireframe.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 24.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

class NewClientAddWireframe: NewClientAddWireframeProtocol {
    
    static func createNewClientAddModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "NewClientAdd", bundle: nil)
        let newClientVC = storyboard.instantiateViewController(withIdentifier: "NewClientAddViewController") as! NewClientAddViewController
        let presenter = NewClientAddPresenter()
        let interactor = NewClientAddInteractor()
        let wireframe = NewClientAddWireframe()
        
        newClientVC.presenter = presenter
        presenter.wireFrame = wireframe
        presenter.interactor = interactor
        presenter.view = newClientVC
        
        interactor.dataManager = CoreDataManager.shared
        
        return newClientVC
    }
    
    func dismissVC(vc: NewClientAddViewProtocol?) {
        guard let vievController = vc as? UIViewController else { return }
        vievController.navigationController?.popViewController(animated: true)
    }
}
