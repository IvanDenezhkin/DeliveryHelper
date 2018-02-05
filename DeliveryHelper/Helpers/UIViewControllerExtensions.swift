//
//  UIViewControllerExtensions.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 01.02.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

extension UIViewController {
    var avaliablePlace: CGFloat {
        let tabBarHeight = self.tabBarController?.tabBar.frame.height ?? 0
        let navigationBarHeight = self.navigationController?.navigationBar.frame.height ?? 0
        return self.view.frame.height - tabBarHeight - navigationBarHeight
    }
}
