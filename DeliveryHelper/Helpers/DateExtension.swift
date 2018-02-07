//
//  DateExtension.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 07.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

extension Date {
    var userPreferedDateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter.string(from: self)
    }
}
