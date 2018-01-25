//
//  NewPlaceAddPresenter.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

class NewPlaceAddPresenter: NewPlaceAddPresenterProtocol {
    var view: NewPlaceAddViewProtocol?
    var interactor: NewPlaceAddInteractorProtocol?
    var wireFrame: NewPlaceAddWireframeProtocol?
    
    func saveNewPlace(place: PlaceModel) {
        interactor?.saveNewPlace(place: place)
        wireFrame?.dismissVC(vc: view)
    }
}
