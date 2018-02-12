//
//  CalendarCell.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 12.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarCell: JTAppleCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var selectionView: UIView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        selectionView.isHidden = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionView.layer.masksToBounds = true
        selectionView.layer.cornerRadius = selectionView.bounds.height / 2
    }
}
