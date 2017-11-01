//
//  ViewController.swift
//  API
//
//  Created by Wyatt Baggett on 10/31/17.
//  Copyright © 2017 Kingdom Digital Media. All rights reserved.
//

import UIKit

// STEP 1
// using fake API endpoint found at https://jsonplaceholder.typicode.com/
// Create a STRUCT to help decode the data as it's recieved
struct Data: Codable {
    var userId: Int
    var id: Int?
    var title: String
    var body: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Create some fake data to get the idea
        let myData = Data(userId: 1, id: 1,
      title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      body: "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto")
        
        print(myData)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    // STEP 2 - Fetch JSON

    
}
