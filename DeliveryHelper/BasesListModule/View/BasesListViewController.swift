//
//  BasesListViewController.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 26.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

class BasesListViewController: UITableViewController, BasesListViewProtocol {
    var presenter: BasesListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenHeight = view.frame.height
        let navigationBarHeight = navigationController?.navigationBar.frame.height ?? 0
        let tabBarHeight = tabBarController?.tabBar.frame.height ?? 0
        let avaliableSpace = screenHeight - navigationBarHeight - tabBarHeight
        return avaliableSpace / 3
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let mode = DataStoragesListTableViewDisplayMode(rawValue: indexPath.row) else { return }
        presenter?.showSelectedBase(base: mode)
    }
}
