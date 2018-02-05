//
//  NewOrderViewController.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 31.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

class NewOrderViewController: UITableViewController, NewOrderViewProtocol {
    var presenter: NewOrderPresenterProtocol?
    
    var cellIDs = ["TitleCell", "ItemsCell", "ClientPlaceCell", "ClientPlaceCell", "ClientPlaceCell",  "ButtonCell"]
    private var addedClientCells = 0
    private var lastIndexPath = IndexPath()
    private var picker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellIDs.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = cellIDs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        switch cellID {
        case "TitleCell":
            if let titleCell = cell as? TitleCell {
                titleCell.nameLabel.text = "New order"
                return titleCell
            }
        case "ItemsCell":
            if let itemsCell = cell as? ItemsCell {
                itemsCell.titleLabel.text = "Item"
                itemsCell.addNewItemButton.addTarget(self, action: #selector(addRow), for: .touchUpInside)
                return itemsCell
            }
        case "ClientPlaceCell":
            if let clientCell = cell as? ClientPlaceCell {
                clientCell.mode = CellDestination(rawValue: addedClientCells)!
                switch clientCell.mode {
                case .clientMode:
                    clientCell.titleLabel.text = "Client"
                case .placeMode:
                    clientCell.titleLabel.text = "Place"
                case .dateMode:
                    clientCell.titleLabel.text = "Date"
                    let picker = UIDatePicker()
                    let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
                    let button = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(setDate))
                    let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
                    self.picker = picker
                    toolBar.setItems([space, button], animated: true)
                    clientCell.selectedClientPlaceTextField.inputView = picker
                    clientCell.selectedClientPlaceTextField.inputAccessoryView = toolBar
                }
                
                addedClientCells += 1
                if addedClientCells > 2 {
                    addedClientCells = 0
                }
                
                return clientCell
            }
        case "ButtonCell":
            if let buttonCell = cell as? ButtonCell {
                buttonCell.addOrderButton.setTitle("Add new order", for: .normal)
                buttonCell.addOrderButton.addTarget(self, action: #selector(addOrder), for: .touchUpInside)
                return buttonCell
            }
        default:
            break
        }
        return cell!
    }
    
    @objc func addRow(sender: UIButton) {
        sender.isHidden = true
        self.cellIDs.insert("ItemsCell", at: 1)
        self.tableView.insertRows(at: [IndexPath(row: 1, section: 0)], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.lastIndexPath = indexPath
        
        if (tableView.cellForRow(at: lastIndexPath) as? ItemsCell) != nil {
            presenter?.showItems()
        }
        
        if let selectedCell = tableView.cellForRow(at: lastIndexPath) as? ClientPlaceCell {
            switch selectedCell.mode {
            case .clientMode:
                presenter?.showClients()
            case .placeMode:
                presenter?.showPlaces()
            case .dateMode:
                selectedCell.selectedClientPlaceTextField.isEnabled = true
                selectedCell.selectedClientPlaceTextField.becomeFirstResponder()
            }
        }
    }
    
    @objc func setDate() {
        if let cell = tableView.cellForRow(at: lastIndexPath) as? ClientPlaceCell {
            cell.selectedClientPlaceTextField.text = picker?.date.description
            cell.selectedClientPlaceTextField.isEnabled = false
        }
        view.endEditing(true)
    }
    
    @objc func addOrder() {
        print("PlacedOrder")
    }
}

extension NewOrderViewController: DataStoragesListDelegateProtocol {
    func passItem(item: ItemModel) {
        if let cellItem = tableView.cellForRow(at: lastIndexPath) as? ItemsCell {
            cellItem.selectedItemTextField.text = item.name
        }
    }
    
    func passClient(client: ClientModel) {
        if let cellItem = tableView.cellForRow(at: lastIndexPath) as? ClientPlaceCell {
            cellItem.selectedClientPlaceTextField.text = "\(client.name)"
        }
    }
    
    func passPlace(place: PlaceModel) {
        if let cellItem = tableView.cellForRow(at: lastIndexPath) as? ClientPlaceCell {
            cellItem.selectedClientPlaceTextField.text = "\(place.city), \(place.street), \(place.homeNumber)"
        }
    }
}
