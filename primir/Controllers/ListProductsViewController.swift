//
//  ViewController.swift
//  primir
//
//  Created by Anika Morris on 10/17/19.
//  Copyright © 2019 Anika Morris. All rights reserved.
//

import UIKit

// Class for initial view controller
class ListProductsTableViewController: UITableViewController {
    
    // instatiate makeup item list of items of Project class
    var products = [Product]() {
        // reload tableView if something has changed
        didSet {
            tableView.reloadData()
        }
    }
    
    // call this function when view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        // read products from Core Data
        products = CoreDataHelper.retrieveProduct()
    }

    // set number of rows in table View
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // set number of rows to number of products
        return products.count
    }
    
    // set tableView cell content
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // downcast cell to class ListProductsTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListProductsTableViewCell", for: indexPath) as! ListProductsTableViewCell
        
        // retrieve product at index 'row'
        let product = products[indexPath.row]
        // display product name and brand in cell
        cell.productNameLabel.text = product.name
        cell.productBrandLabel.text = product.brand
        
        return cell
    }
    
    // add swipe to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let productToDelete = products[indexPath.row]
            // delete product from Core Data using CoreDataHelper
            CoreDataHelper.delete(product: productToDelete)
            
            // set products to updated product list
            products = CoreDataHelper.retrieveProduct()
        }
    }
    
    // set up segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "displayProduct":
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            // if identifier is 'displayProduct', set product in destination VC (DisplayProductsVC) to the selected product
            let product = products[indexPath.row]
            let destination = segue.destination as! DisplayProductsViewController
            destination.product = product
            
        case "addProduct":
            // ensure button segues are correct
            print("add product bar button item tapped")
            
        default:
            // handle unexpected identifier
            print("unexpected segue identifier")
        }
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        // when segue unwinds, re-read products from Core Data
        products = CoreDataHelper.retrieveProduct()
    }
}

