//
//  ViewController.swift
//  API
//
//  Created by Wyatt Baggett on 10/31/17.
//  Copyright © 2017 Kingdom Digital Media. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad() {
        
        //init(from decoder: Decoder) throws
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // using fake API endpoint found at https://jsonplaceholder.typicode.com/
    
    // STEP 1
    
    // Create a STRUCT to help decode the data as it's recieved
    struct data: Codable {
        var userId: Int
        var id: Int?
        var title: String
        var body: String
    }
    
    // STEP 2 - Fetch JSON

    
}
