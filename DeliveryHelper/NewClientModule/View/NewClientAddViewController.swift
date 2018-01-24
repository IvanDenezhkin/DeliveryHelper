//
//  NewClientAddViewController.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 24.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

class NewClientAddViewController : UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    var presenter: NewClientAddViewOutProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let name = nameTextField.text else { return }
        guard let phoneNumber = phoneTextField.text else { return }
        let newClient = ClientModel(withName: name, phoneNumber: phoneNumber)
        presenter?.saveNewClient(client: newClient)
    }
    
}
