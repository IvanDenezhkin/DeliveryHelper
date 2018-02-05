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
        return self.avaliablePlace / 3
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let mode = DataStoragesListTableViewDisplayMode(rawValue: indexPath.row) else { return }
        presenter?.showSelectedBase(base: mode)
    }
}
