//
//  NewPlaceAddPresenterProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

protocol NewPlaceAddPresenterProtocol: class {
    var view: NewPlaceAddViewProtocol? { get set }
    var interactor: NewPlaceAddInteractorProtocol? { get set }
    var wireFrame: NewPlaceAddWireframeProtocol? { get set }
    func saveNewPlace(place: PlaceModel)
}
