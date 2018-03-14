//
//  OrderCell.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 14.03.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

class OrderCell: UICollectionViewCell {
    @IBOutlet weak var textLabel: UILabel!
    
    var order: OrderModel? {
        didSet {
            decorateWithOrder(order: order!)
        }
    }
    
    func decorateWithOrder(order: OrderModel) {
        var text = ""
        
        if let client = CoreDataManager.shared.context.object(with: order.client) as? Client {
            text.append("Client: \(client.name ?? "")\n\(client.phoneNumber ?? "")\n")
        }
        text.append("Items:\n")
        for item in order.items {
            text.append("  •\(item.name ?? "") x \(item.quantity ?? 0)\n")
        }
        textLabel.text = text
    }
}
