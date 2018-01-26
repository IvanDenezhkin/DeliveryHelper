//
//  BasesListViewProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 26.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

protocol BasesListViewProtocol: class {
    var presenter: BasesListPresenterProtocol? { get set }
}
