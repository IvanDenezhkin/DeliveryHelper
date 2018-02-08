//
//  ClientPlaceCell.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 01.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

enum CellDestination: Int {
    case clientMode
    case placeMode
    case dateMode
}

class ClientPlaceCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectedClientPlaceTextField: UITextField!

    var mode:CellDestination = .clientMode
    
    override func prepareForReuse() {
        super.prepareForReuse()
        selectedClientPlaceTextField.text = nil
    }
}
