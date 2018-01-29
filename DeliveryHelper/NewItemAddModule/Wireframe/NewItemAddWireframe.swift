//
//  NewItemAddWireframe.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

class NewItemAddWireframe: NewItemAddWireframeProtocol {
    static func createNewItemAddModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "NewItemAdd", bundle: nil)
        let newItemVC = storyboard.instantiateViewController(withIdentifier: "NewItemAddViewController") as! NewItemAddViewController
        let presenter = NewItemAddPresenter()
        let interactor = NewItemAddInteractor()
        let wireframe = NewItemAddWireframe()
        
        newItemVC.presenter = presenter
        presenter.wireFrame = wireframe
        presenter.interactor = interactor
        presenter.view = newItemVC
        
        interactor.dataManager = CoreDataManager.shared
        
        return newItemVC
    }
    
    func dismissVC(vc: NewItemAddViewProtocol?) {
        guard let vievController = vc as? UIViewController else { return }
        vievController.navigationController?.popViewController(animated: true)
    }
}
