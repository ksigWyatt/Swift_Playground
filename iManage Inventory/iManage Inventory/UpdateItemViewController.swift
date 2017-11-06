//
//  SecondViewController.swift
//  iManage Inventory
//
//  Created by Wyatt Baggett on 11/6/17.
//  Copyright © 2017 Wyatt Baggett. All rights reserved.
//

import UIKit

class UpdateItemViewController: UIViewController {
    
    @IBOutlet weak var currentStock: UILabel!
    var quantity: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recieved(_ sender: Any) {
        quantity += 100
        currentStock.text = "\(quantity)"
    }
    
    @IBAction func consumed(_ sender: Any) {
        quantity -= 100
        
        if (quantity < 0) {
            
            let alert = UIAlertController(title: "Alert!",
                                          message: "There can't be negative stock - Unless you sold it too well ;)",
                                          preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay",
                                          style: UIAlertActionStyle.default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
            quantity = 0
        }
        currentStock.text = "\(quantity)"
    }
}

