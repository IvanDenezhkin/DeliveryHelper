//
//  CoreDataManager.swift
//  DeliveryHelper
//
//  Created by Ivan Denezhkin on 23.01.2018.
//  Copyright © 2018 Ivan Denezhkin. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    private init() { }
    
    lazy var context = self.persistentContainer.viewContext
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataBase")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let unwrapedError = error {
                //TODO: add Crashlytics or Lumberjack here
                print(unwrapedError)
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                //TODO: add Crashlytics or Lumberjack here
                print(error)
            }
        }
    }
    
    func addNewClient(client: ClientModel) {
        let newEntity = Client(context: self.context)
        newEntity.name = client.name
        newEntity.phoneNumber = client.phoneNumber
        print("saved new client: \(client.name)")
        saveContext()
    }
    
    func addNewItem(item: ItemModel) {
        let newEntity = Item(context: self.context)
        newEntity.name = item.name
        print("saved new item: \(item.name)")
        saveContext()
    }
    
    func addNewPlace(place: PlaceModel) {
        let newEntity = Place(context: self.context)
        newEntity.city = place.city
        newEntity.street = place.street
        newEntity.number = place.homeNumber
        print("saved new place: \(place.city)")
        saveContext()
    }
    
    func addNewOrder(withOrder order: OrderModel) {
        let newEntity = Order(context: self.context)
        newEntity.client = self.context.object(with: order.client) as? Client
        newEntity.place = self.context.object(with: order.place) as? Place
        newEntity.items = order.items as NSObject
        newEntity.dateOfDelivery = order.date
        saveContext()
        test()
    }
    
    private func client(withClientModel: ClientModel) -> Client? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Client")
        fetchRequest.predicate = NSPredicate(format: "name == %@", withClientModel.name)
        do {
            let results = try self.context.fetch(fetchRequest)
            return results.first as? Client
        } catch {
            //TODO: add Crashlytics or Lumberjack here
            print(error)
            return nil
        }
    }
    
    func fetchAllEntityes<EntityType>(forType: EntityType.Type, date: Date? = nil) -> [EntityType]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "\(EntityType.self)")
        if date != nil {
            fetchRequest.predicate = NSPredicate(format: "dateOfDelivery >= %@", date! as NSDate)
        }
        do {
            let results = try self.context.fetch(fetchRequest)
            return results as? [EntityType]
        } catch {
            //TODO: add Crashlytics or Lumberjack here
            print(error)
            return nil
        }
    }
    
    private func test() {
        let orders = self.fetchAllEntityes(forType: Order.self)
        for order in orders! {
            print(order.client?.name, order.client?.phoneNumber, order.dateOfDelivery, order.items)
            for item in order.items as! [ItemModel] {
                print("\(item.name) x \(item.quantity)")
            }
        }
    }
}
