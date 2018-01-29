//
//  NewPlaceAddInteractorProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

protocol NewPlaceAddInteractorProtocol: class {
    var dataManager: CoreDataManager? { get set }
    func saveNewPlace(place: PlaceModel)
}
