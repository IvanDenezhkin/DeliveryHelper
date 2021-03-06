//
//  NewPlaceAddWireframe.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit
import GooglePlacePicker

class NewPlaceAddWireframe: NewPlaceAddWireframeProtocol {
    static func createNewPlaceAddModule() -> UIViewController {
        let config = GMSPlacePickerConfig(viewport: nil)
        let newItemVC = NewPlaceAddViewController(config: config)
        let presenter = NewPlaceAddPresenter()
        let interactor = NewPlaceAddInteractor()
        let wireframe = NewPlaceAddWireframe()
        
        newItemVC.presenter = presenter
        presenter.wireFrame = wireframe
        presenter.interactor = interactor
        presenter.view = newItemVC
        
        interactor.dataManager = CoreDataManager.shared
        
        return newItemVC
    }
    
    func dismissVC(vc: NewPlaceAddViewProtocol?) {
        guard let vievController = vc as? UIViewController else { return }
        vievController.navigationController?.popViewController(animated: true)
    }
}
