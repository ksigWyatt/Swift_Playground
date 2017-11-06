//
//  SecondViewController.swift
//  iManage Inventory
//
//  Created by Wyatt Baggett on 11/6/17.
//  Copyright © 2017 Wyatt Baggett. All rights reserved.
//

import UIKit

class UpdateItemViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var partNumber: UITextView!
    @IBOutlet weak var currentStock: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var commentText: UITextView!
    var item: Item? = nil
    
    
    var partNumberValue: Int? {
        get { return partNumber.text == nil ? nil : Int(partNumber.text!) }
        set {
            partNumber.text = newValue != nil ? "\(newValue!)" : nil
        }
    }
    
    var currentStockValue: Int? {
        get { return currentStock.text == nil ? nil : Int(currentStock.text!) }
        set {
            currentStock.text = newValue != nil ? "\(newValue!)" : nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // let the keyboard dissappear when neccessary
        descriptionText.delegate = self
        commentText.delegate = self
        partNumber.delegate = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Load all the text & what not into hthe view
        currentStock.text = "\(item?.quantity ?? 0)"
        partNumber.text = "\(item?.number ?? 0)"
        descriptionText.text =
            item?.description ?? ""
        commentText.text = item?.comments ?? ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Update the table View controller while performing the segue
        guard let id = item?.id else { return }
        let index = StoreItems.items.index{$0.id == id}
        
        if let index = index {
            StoreItems.items.remove(at: index)
        }
        
        item?.description = descriptionText.text
        item?.number = Int(partNumber.text)!
        item?.description = descriptionText.text
        item?.quantity = (self.currentStockValue ?? 0)
        StoreItems.items.insert(item!, at: index ?? StoreItems.items.count)
    }

    @IBAction func recieved(_ sender: Any) {
        let alertController = UIAlertController(title: "How Many?", message: "Please enter how many were recieved:", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (_) in
            if let field = alertController.textFields?[0] {
                // store the text
                let value = field.text != nil ? Int(field.text!) : 0
                self.currentStockValue = (self.currentStockValue ?? 0) + (value ?? 0)
                self.item?.quantity -= Int(field.text!)!
            } else {
                // user did not fill field
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter an integer"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func consumed(_ sender: Any) {
        let alertController = UIAlertController(title: "How Many?", message: "Please enter how many were consumed:", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (_) in
            if let field = alertController.textFields?[0] {
                // Store the text
                let value = field.text != nil ? Int(field.text!) : 0
                self.currentStockValue = (self.currentStockValue ?? 0) - (value ?? 0)
                self.item?.quantity -= Int(field.text!)!
                
                
                if ((self.currentStockValue)! < 0) {
                    
                    let alert = UIAlertController(title: "Alert!",
                                                  message: "There can't be negative stock - Unless you sold it too well ;)",
                                                  preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Okay",
                                                  style: UIAlertActionStyle.default,
                                                  handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    self.currentStockValue = 0
                }
            } else {
                // user did not fill field
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter an integer"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

