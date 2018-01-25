//
//  NewItemAddWireframeProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 25.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

protocol NewItemAddWireframeProtocol {
    static func createNewItemAddModule() -> UIViewController
    func dismissVC(vc: NewItemAddViewProtocol?)
}
