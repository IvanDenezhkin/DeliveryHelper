//
//  NewOrderViewProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 31.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

protocol NewOrderViewProtocol: class {
    var presenter: NewOrderPresenterProtocol? { get set }
}
