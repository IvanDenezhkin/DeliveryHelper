//
//  NewPlaceAddInteractor.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

class NewPlaceAddInteractor: NewPlaceAddInteractorProtocol {
    var dataManager: CoreDataManager?
    
    func saveNewPlace(place: PlaceModel) {
        dataManager?.addNewPlace(place: place)
    }
    

}
