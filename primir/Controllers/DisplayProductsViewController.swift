//
//  DisplayProductsViewController.swift
//  primir
//
//  Created by Anika Morris on 10/17/19.
//  Copyright © 2019 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class DisplayProductsViewController: UIViewController, UITextViewDelegate {
    
    var product: Product?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let product = product {
            nameTextField.text = product.name
            brandTextField.text = product.brand
            priceTextField.text = product.price
            if product.content == "Product Notes" {
                contentTextView.text = ""
            } else {
                contentTextView.text = product.content
            }
        } else {
            nameTextField.text = ""
            brandTextField.text = ""
            contentTextView.delegate = self
            contentTextView.text = "Product Notes"
            contentTextView.textColor = UIColor.lightGray
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "save" where product != nil:
            product?.name = nameTextField.text ?? ""
            product?.content = contentTextView.text ?? ""
            product?.price = priceTextField.text ?? ""
            product?.brand = brandTextField.text ?? ""
            
            CoreDataHelper.saveProduct()
            
        case "save" where product == nil:
            let product = CoreDataHelper.newProduct()
            product.name = nameTextField.text ?? ""
            product.content = contentTextView.text ?? ""
            product.brand = brandTextField.text ?? ""
            product.price = priceTextField.text ?? ""
            
            CoreDataHelper.saveProduct()

        case "cancel":
            print("cancel bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if contentTextView.textColor == UIColor.lightGray {
            contentTextView.text = nil
            contentTextView.textColor = UIColor.black
        }
    }
}
