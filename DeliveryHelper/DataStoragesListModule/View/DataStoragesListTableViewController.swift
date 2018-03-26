//
//  DataStoragesListTableViewController.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 23.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

enum DataStoragesListTableViewDisplayMode: Int {
    case displayModeItem
    case displayModeClient
    case displayModePlace
}

class DataStoragesListTableViewController: UITableViewController {
    var presenter: (DataStoragesListPresenterProtocol & DataStoragesListDelegateProtocol)?
    var state: DataStoragesListTableViewDisplayMode = .displayModeItem
    var clients: [ClientModel] = []
    var items: [ItemModel] = []
    var places: [PlaceModel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.fetchEntities(forMode: state)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch state {
        case .displayModeItem:
            return items.count
        case .displayModeClient:
            return clients.count
        case .displayModePlace:
            return places.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch state {
        case .displayModeItem:
            let item = items[indexPath.row]
            return decorateItemCell(withItem: item)
        case .displayModeClient:
            let client = clients[indexPath.row]
            return decorateClientCell(withClient: client)
        case .displayModePlace:
            let place = places[indexPath.row]
            return decoratePlaceCell(withPlace: place)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch state {
        case .displayModeItem:
            presenter?.passItem(item: items[indexPath.row])
        case .displayModeClient:
            presenter?.passClient(client: clients[indexPath.row])
        case .displayModePlace:
            presenter?.passPlace(place: places[indexPath.row])
        }
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            switch self.state {
            case .displayModeItem:
                self.presenter?.removeEntity(entityID: self.items[indexPath.row].objectID!)
                self.items.remove(at: indexPath.row)
            case .displayModeClient:
                self.presenter?.removeEntity(entityID: self.clients[indexPath.row].objectID!)
                self.clients.remove(at: indexPath.row)
            case .displayModePlace:
                self.presenter?.removeEntity(entityID: self.places[indexPath.row].objectID!)
                self.places.remove(at: indexPath.row)
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return [deleteAction]
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        presenter?.dismissVC()
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        presenter?.addNewEntity(forMode: self.state)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch state {
        case .displayModeItem:
            return 40
        case .displayModeClient:
            return 60
        case .displayModePlace:
            return 80
        }
    }
    
    private func decorateItemCell(withItem item: ItemModel) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemCell
        cell.itemNameLabel.text = item.name
        return cell
    }
    
    private func decoratePlaceCell(withPlace place: PlaceModel) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell") as! PlaceCell
        cell.adressLabel.text = place.adress
        return cell
    }
    
    private func decorateClientCell(withClient client: ClientModel) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClientCell") as! ClientCell
        cell.clientsNameLabel.text = client.name
        cell.clientsPhoneNumber.text = client.phoneNumber
        return cell
    }
    
}

extension DataStoragesListTableViewController: DataStoragesListViewProtocol {
    func startLoading() {
        //TODO: Add some Loading indicator
    }
    
    func stopLoading() {
        //TODO: Add some Loading indicator
    }
    
    func updateItems(withItems: [ItemModel]) {
        items = withItems
        tableView.reloadData()
    }
    
    func updateClients(withClients: [ClientModel]) {
        clients = withClients
        tableView.reloadData()
    }
    
    func updatePlaces(withPlaces: [PlaceModel]) {
        places = withPlaces
        tableView.reloadData()
    }
}
