//
//  ItemsCell.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 01.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

class ItemsCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectedItemTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var addNewItemButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
