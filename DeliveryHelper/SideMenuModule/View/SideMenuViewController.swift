//
//  SideMenuViewController.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 26.03.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {
    var presenter: SideMenuPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension SideMenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as? MenuCell
        switch indexPath.row {
        case 0:
            cell?.titleLabel.text = "My Items"
        case 1:
            cell?.titleLabel.text = "My Clients"
        case 2:
            cell?.titleLabel.text = "My Places"
        default:
            break
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let mode = DataStoragesListTableViewDisplayMode(rawValue: indexPath.row) else { return }
        presenter?.showDataStorageList(with: mode)
    }
}
