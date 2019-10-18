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
        // reference 
        products = CoreDataHelper.retrieveProduct()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListProductsTableViewCell", for: indexPath) as! ListProductsTableViewCell
        
        let product = products[indexPath.row]
        cell.productNameLabel.text = product.name
        cell.productBrandLabel.text = product.brand
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let productToDelete = products[indexPath.row]
            CoreDataHelper.delete(product: productToDelete)
            
            products = CoreDataHelper.retrieveProduct()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "displayProduct":
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let product = products[indexPath.row]
            let destination = segue.destination as! DisplayProductsViewController
            destination.product = product
            
        case "addProduct":
            print("add product bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        products = CoreDataHelper.retrieveProduct()
    }
}

