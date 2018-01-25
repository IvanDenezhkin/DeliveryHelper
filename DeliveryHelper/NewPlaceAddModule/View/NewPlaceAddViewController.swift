//
//  NewPlaceAddViewController.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

class NewPlaceAddViewController: UIViewController, NewPlaceAddViewProtocol {
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    
    var presenter: NewPlaceAddPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let cityName = cityTextField.text else { return }
        guard let street = streetTextField.text else { return }
        guard let number = numberTextField.text else { return }
        let newPlace = PlaceModel(withCity: cityName, street: street, homeNumber: number)
        presenter?.saveNewPlace(place: newPlace)
    }
    
}
