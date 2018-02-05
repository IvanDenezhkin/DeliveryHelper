//
//  DataStoragesListDelegateProtocol.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 02.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import Foundation

protocol DataStoragesListDelegateProtocol: class {
    func passItem(item: ItemModel)
    func passClient(client: ClientModel)
    func passPlace(place: PlaceModel)
}
