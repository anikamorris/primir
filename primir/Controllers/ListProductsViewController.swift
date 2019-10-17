//
//  ViewController.swift
//  primir
//
//  Created by Anika Morris on 10/17/19.
//  Copyright © 2019 Anika Morris. All rights reserved.
//

import UIKit

class ListProductsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListProductsTableViewCell", for: indexPath) as! ListProductsTableViewCell
        
        cell.productNameLabel.text = "Product Name"
        cell.productBrandLabel.text = "Brand"
        cell.dateAddedLabel.text = "Date Added"
        
        return cell
    }
}
