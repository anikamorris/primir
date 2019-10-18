//
//  DisplayProductsViewController.swift
//  primir
//
//  Created by Anika Morris on 10/17/19.
//  Copyright © 2019 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

// DisplayProductsViewController inherits from UIViewController and UITextViewDelegate so that actions can be performed with contextTextView
class DisplayProductsViewController: UIViewController, UITextViewDelegate {
    
    // define mutable variable product as class Product
    var product: Product?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // call this function before view will appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        // set corner radii
        nameTextField.layer.cornerRadius = 15.0
        brandTextField.layer.cornerRadius = 15.0
        priceTextField.layer.cornerRadius = 15.0
        contentTextView.layer.cornerRadius = 10.0
        // if there are any products
        if let product = product {
            // set nav bar title
            let brand = product.brand ?? ""
            let space = " "
            let name = product.name ?? ""
            let title = brand + space + name
            self.title = title
            
            // set text field text to product info
            nameTextField.text = product.name
            brandTextField.text = product.brand
            priceTextField.text = product.price
            // if user didn't save notes on the product...
            if product.content == "  Product Notes" {
                // ... either empty text view ...
                contentTextView.text = ""
            } else {
                // ... or set contextTextView to saved notes
                contentTextView.text = product.content
            }
        } else {
            // if the user is adding a new product, empty text fields
            nameTextField.text = ""
            brandTextField.text = ""
            // create fake placeholder text
            contentTextView.delegate = self
            contentTextView.text = "  Product Notes"
            contentTextView.textColor = UIColor.placeholderGray
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        // if segue identifier is 'save' and a product exists
        case "save" where product != nil:
            // unwrap text field content and save it to respective Core Data attributes
            // if there's nothing in the text field, set it to an empty string
            product?.name = nameTextField.text ?? ""
            product?.content = contentTextView.text ?? ""
            product?.price = priceTextField.text ?? ""
            product?.brand = brandTextField.text ?? ""
            
            // update product through CoreDataHelper
            CoreDataHelper.saveProduct()
            
        // if segue identifier is 'save' and the user is creating a new product
        case "save" where product == nil:
            // create a new product in Core Data
            let product = CoreDataHelper.newProduct()
            // unwrap text field content and save it to respective Core Data attributes
            // if there's nothing in the text field, set it to an empty string
            product.name = nameTextField.text ?? ""
            product.content = contentTextView.text ?? ""
            product.brand = brandTextField.text ?? ""
            product.price = priceTextField.text ?? ""
            
            // save product with attributes
            CoreDataHelper.saveProduct()

        case "cancel":
            print("cancel bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
    
    // finish setting up fake placeholder text functionality
    func textViewDidBeginEditing(_ textView: UITextView) {
        if contentTextView.textColor == UIColor.placeholderGray {
            contentTextView.text = nil
            contentTextView.textColor = UIColor.black
        }
    }
}
