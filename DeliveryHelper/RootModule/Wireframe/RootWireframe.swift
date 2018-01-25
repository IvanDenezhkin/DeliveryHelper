//
//  RootWireframe.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 23.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

class RootWireframe: RootWireframeProtocol {
    var window: UIWindow
    
    init(withWindow: UIWindow) {
        self.window = withWindow
    }
    
    func presentRootController() {
        let rootViewController = RootTableViewController()
        let vc = DataStoragesListWireframe.createDataStoragesListModule(withDisplayMode: .displayModeClient)
        let itemVC = NewItemAddWireframe.createNewItemAddModule()
        let placesVC = NewPlaceAddWireframe.createNewPlaceAddModule()
        rootViewController.setViewControllers([vc, itemVC, placesVC], animated: true)
        self.window.rootViewController = rootViewController
        self.window.makeKeyAndVisible()
    }
}
