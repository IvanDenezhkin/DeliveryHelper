//
//  RootWireframeProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 23.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

protocol RootWireframeProtocol {
    var window: UIWindow { get }
    func presentRootController()
}
