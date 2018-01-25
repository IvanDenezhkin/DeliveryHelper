//
//  DataStoragesListTableViewController.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 23.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit

enum DataStoragesListTableViewDisplayMode {
    case displayModeItem
    case displayModeClient
    case displayModePlace
}

class DataStoragesListTableViewController: UITableViewController {
    var presenter: DataStoragesListPresenterProtocol?
    
    var state: DataStoragesListTableViewDisplayMode = .displayModeItem
    var clients: [ClientModel] = []
    var items: [ItemModel] = []
    var places: [PlaceModel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.fetchEntityes(forMode: state)
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
        print("Selected: \(indexPath.row)")
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        presenter?.addNewEntity(forMode: self.state)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    private func decorateItemCell(withItem item: ItemModel) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemCell
        cell.itemNameLabel.text = item.name
        return cell
    }
    
    private func decoratePlaceCell(withPlace place: PlaceModel) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell") as! PlaceCell
        cell.cityLabel.text = place.city
        cell.streetLabel.text = place.street
        cell.homeNumberLabel.text = place.homeNumber
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