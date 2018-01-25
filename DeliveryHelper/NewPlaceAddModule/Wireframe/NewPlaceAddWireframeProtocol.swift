//
//  NewPlaceAddWireframeProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

protocol NewPlaceAddWireframeProtocol: class {
    static func createNewPlaceAddModule() -> UIViewController
    func dismissVC(vc: NewPlaceAddViewProtocol?)
}
