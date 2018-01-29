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
    
    func fetchAllEntityes<EntityType>(forType: EntityType.Type) -> [EntityType]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "\(EntityType.self)")
        do {
            let results = try self.context.fetch(fetchRequest)
            return results as? [EntityType]
        } catch {
            //TODO: add Crashlytics or Lumberjack here
            print(error)
            return nil
        }
    }
}
