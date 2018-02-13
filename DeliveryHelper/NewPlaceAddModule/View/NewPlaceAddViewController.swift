//
//  NewPlaceAddViewController.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GooglePlacePicker

class NewPlaceAddViewController: GMSPlacePickerViewController, NewPlaceAddViewProtocol, GMSPlacePickerViewControllerDelegate {
    var presenter: NewPlaceAddPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override init(config: GMSPlacePickerConfig) {
        super.init(config: config)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
        presenter?.saveNewPlace(place: PlaceModel(adress: place.formattedAddress ?? place.name, latitude: place.coordinate.latitude, longitude: place.coordinate.longitude))
    }
}
