//
//  GuestViewModel.swift
//  GuestsCoreData
//
//  Created by Aldair Raul Cosetito Coral on 11/5/20.
//

import Foundation
import CoreData

class GuestViewModel {
    
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func delete(guest: NSManagedObject) {
        context.delete(guest)
        do {
            try context.save()
        } catch let error as NSError {
            fatalError("Could not save \(error) - \(error.userInfo)")
        }
    }
    
    func save(name: String) -> NSManagedObject {
        let entity = NSEntityDescription.entity(forEntityName: "Guest",
                                                in: context)!
        
        let guest = NSManagedObject.init(entity: entity,
                                         insertInto: context)
        guest.setValue(name, forKey: "name")
        
        do {
            try context.save()
            return guest
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        return NSManagedObject()
    }
    
    func getGuests() -> [NSManagedObject] {
        
        let request = NSFetchRequest<NSManagedObject>.init(entityName: "Guest")
        
        do {
            return try context.fetch(request)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return []
    }
}
