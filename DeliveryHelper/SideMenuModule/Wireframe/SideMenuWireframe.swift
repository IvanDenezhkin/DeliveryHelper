//
//  SideMenuWireframe.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 26.03.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuWireframe: SideMenuWireframeProtocol {
    static func createSideMenuModule(onView mainView: UIViewController) -> UIViewController {
        // Side menu Customization
        SideMenuManager.default.menuPresentMode = .viewSlideOut
        SideMenuManager.default.menuFadeStatusBar = false
        
        let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
        let sideMenuVC = storyboard.instantiateViewController(withIdentifier: "SideMenuViewController") as! SideMenuViewController
        
        let presenter = SideMenuPresenter()
        sideMenuVC.presenter = presenter
        presenter.menuView = sideMenuVC
        presenter.mainView = mainView
        
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: sideMenuVC)
        menuLeftNavigationController.navigationBar.isHidden = true
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
        
        return menuLeftNavigationController
    }
}
