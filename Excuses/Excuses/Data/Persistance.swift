//
//  Persistance.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 27.6.22..
//

import Foundation
import CoreData
import Combine
import SwiftUI

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    

    init() {
        container = NSPersistentContainer(name: "Excuses")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
    }
    
    static func saveExcuse(content: String, category: String) {
        let excuse = ExcuseMO(context: shared.container.viewContext)
            excuse.cnt = content
            excuse.category = category
            excuse.id = UUID()
        print("Saved!!!\n\(excuse)")
            saveContext()
    }
    
    static func deleteExcuse(content: String) {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ExcuseMO")
        do {
            let results = try shared.container.viewContext.fetch(request)
    
            if results.count > 0 {
                if let results = results as? [ExcuseMO] {
                    for res in results {
                        if res.cnt == content {
                            shared.container.viewContext.delete(res)
                        }
                    }
                    
                }
                try shared.container.viewContext.save()
                print("removed")
            }
        }
        catch {
            print("Erorr...")
        }
    }
    
    static func itemExists(_ item: String) -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ExcuseMO")
        fetchRequest.predicate = NSPredicate(format: "cnt == %@", item)
        return ((try? shared.container.viewContext.count(for: fetchRequest)) ?? 0) > 0
    }
    
    static private func saveContext() {
        do {
            try PersistenceController.shared.container.viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Error: \(error)")
        }
    }
    
}
