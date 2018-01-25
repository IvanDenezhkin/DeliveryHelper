//
//  NewItemAddViewController.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

class NewItemAddViewController: UIViewController, NewItemAddViewProtocol {
    @IBOutlet weak var itemNameTextField: UITextField!

    var presenter: NewItemAddPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let newName = itemNameTextField.text else { return }
        let item = ItemModel(withName: newName)
        presenter?.saveNewItem(item: item)
    }
    
}
