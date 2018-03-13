//
//  NewOrderViewController.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 31.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit
import CoreData

class NewOrderViewController: UITableViewController, NewOrderViewProtocol {
    var presenter: NewOrderPresenterProtocol?
    
    var cellIDs = ["TitleCell", "ItemsCell", "ClientPlaceCell", "ClientPlaceCell", "ClientPlaceCell",  "ButtonCell"]
    private var addedClientCells = 0
    private var lastIndexPath = IndexPath()
    private var picker: UIDatePicker?
    
    private var client: NSManagedObjectID?
    private var place: NSManagedObjectID?
    private var items = [ItemModel]()
    private var date = Date()
    
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
                itemsCell.addNewItemButton.isEnabled = false
                itemsCell.addNewItemButton.addTarget(self, action: #selector(addRow), for: .touchUpInside)
                itemsCell.quantityTextField.inputAccessoryView = self.addToolBar(target: self, action: #selector(setQuantity))
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
                    clientCell.selectedClientPlaceTextField.text = self.date.userPreferedDateString
                    let picker = UIDatePicker()
                    picker.datePickerMode = .date
                    picker.locale = Locale.current
                    self.picker = picker
                    clientCell.selectedClientPlaceTextField.inputView = picker
                    clientCell.selectedClientPlaceTextField.inputAccessoryView = self.addToolBar(target: self, action: #selector(setDate))
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
                tableView.allowsSelection = false
            }
        }
    }
    
    @objc func setDate() {
        self.date = picker!.date
        if let cell = tableView.cellForRow(at: lastIndexPath) as? ClientPlaceCell {
            cell.selectedClientPlaceTextField.text = picker?.date.userPreferedDateString
            cell.selectedClientPlaceTextField.isEnabled = false
        }
        view.endEditing(true)
        tableView.allowsSelection = true
    }
    
    @objc func setQuantity() {
        if let cell = tableView.cellForRow(at: lastIndexPath) as? ItemsCell {
            cell.addNewItemButton.isEnabled = true
            items.last?.quantity = Int(cell.quantityTextField.text!)
        }
        view.endEditing(true)
        tableView.allowsSelection = true
    }
    
    @objc func addOrder() {
        presenter?.validateDate(date: date, client: client, place: place, items: items)
    }
    
    func showAlert(text: String) {
        showAlert(title: "Error", message: text)
    }
    
    private func addToolBar(target: Any?, action: Selector) -> UIToolbar {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        let button = UIBarButtonItem(title: "Done", style: .done, target: target, action: action)
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([space, button], animated: true)
        return toolBar
    }
    
    func clearData() {
        client = nil
        place = nil
        items.removeAll()
        cellIDs = ["TitleCell", "ItemsCell", "ClientPlaceCell", "ClientPlaceCell", "ClientPlaceCell",  "ButtonCell"]
        tableView.reloadData()
    }
}

extension NewOrderViewController: DataStoragesListDelegateProtocol {
    func passItem(item: ItemModel) {
        items.append(item)
        if let cellItem = tableView.cellForRow(at: lastIndexPath) as? ItemsCell {
            cellItem.selectedItemTextField.text = item.name
            cellItem.quantityTextField.becomeFirstResponder()
            tableView.allowsSelection = false
        }
    }
    
    func passClient(client: ClientModel) {
        self.client = client.objectID
        if let cellItem = tableView.cellForRow(at: lastIndexPath) as? ClientPlaceCell {
            cellItem.selectedClientPlaceTextField.text = "\(client.name)"
        }
    }
    
    func passPlace(place: PlaceModel) {
        self.place = place.objectID
        if let cellItem = tableView.cellForRow(at: lastIndexPath) as? ClientPlaceCell {
            cellItem.selectedClientPlaceTextField.text = "\(place.adress)"
        }
    }
}
