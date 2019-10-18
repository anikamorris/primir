//
//  CoreDataHelper.swift
//  primir
//
//  Created by Anika Morris on 10/17/19.
//  Copyright © 2019 Anika Morris. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct CoreDataHelper {
    // set up context to be able to save product
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    // instantiate new product and add to Core Data
    static func newProduct() -> Product {
        let product = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context) as! Product
        
        return product
    }
    
    // save context
    static func saveProduct() {
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    // delete product
    static func delete(product: Product) {
        context.delete(product)
        saveProduct()
    }
    
    // read from Core Data to retrieve products
    static func retrieveProduct() -> [Product] {
        do {
            let fetchRequest = NSFetchRequest<Product>(entityName: "Product")
            let results = try context.fetch(fetchRequest)
            
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
    }
}
