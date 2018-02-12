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
    
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: self.startOfDay)!
    }
    
    static var startOfCurrentYear: Date {
        let components = Calendar.current.dateComponents([.year], from: Date())
        return Calendar.current.date(from: components)!
    }
    
    static var endOfCurrentYear: Date {
        var components = DateComponents()
        components.year = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: self.startOfCurrentYear)!
    }
}
