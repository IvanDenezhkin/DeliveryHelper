//
//  NetworkError.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 12.03.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case noData
    case noCoordinates
    case noPolyline
    
    var localizedDescription: String {
        switch self {
        case .noData:
            return "No data available"
        case .noCoordinates:
            return "Can`t parse coordinates"
        case .noPolyline:
            return "Can`t parse polyline"
        }
    }
}
