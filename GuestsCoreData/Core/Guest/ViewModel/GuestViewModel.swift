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
    
    func deletInvited() {
        
    }
    
    func saveInvited(name: String) {
        
    }
    
    func getGuests() -> [String] {
        return []
    }
}
