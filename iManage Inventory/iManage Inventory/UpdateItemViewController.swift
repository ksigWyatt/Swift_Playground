//
//  SecondViewController.swift
//  iManage Inventory
//
//  Created by Wyatt Baggett on 11/6/17.
//  Copyright © 2017 Wyatt Baggett. All rights reserved.
//

import UIKit

class UpdateItemViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var currentStock: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var commentText: UITextView!
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        descriptionText.delegate = self
        commentText.delegate = self
        currentStock.text = StoreItems.items.quantity
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recieved(_ sender: Any) {
        count += 100
        currentStock.text = "\(count)"
    }
    
    @IBAction func consumed(_ sender: Any) {
        count -= 100
        
        if (count < 0) {
            
            let alert = UIAlertController(title: "Alert!",
                                          message: "There can't be negative stock - Unless you sold it too well ;)",
                                          preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay",
                                          style: UIAlertActionStyle.default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
            count = 0
        }
        currentStock.text = "\(count)"
    }
}

