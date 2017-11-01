//
//  ViewController.swift
//  API
//
//  Created by Wyatt Baggett on 10/31/17.
//  Copyright © 2017 Kingdom Digital Media. All rights reserved.
//

import UIKit

// using fake API endpoint found at https://jsonplaceholder.typicode.com/

// STEP 1
// Create a STRUCT to help decode the data as it's recieved
struct Data: Decodable {
    var userId: Int
    var id: Int?
    var title: String
    var body: String
}

struct Course: Decodable {
    var id: Int
    var name: String
    var link: String
    var imageUrl: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create some fake data to get the idea - Understanding the Object types for JSON
        let myData = Data(userId: 1, id: 1,
                          title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
                          body: "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto")
        
        singleJSONItem()
        
        
        // Array of JSON Items Found at https://api.letsbuildthatapp.com/jsondecodable/courses
        arrayOfJSON()
        
        //perform something a little more in depth
        complexJSON()
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func singleJSONItem() {
        
        // STEP 2 - Fetch JSON from endpoint
        let jsonURLString = "https://jsonplaceholder.typicode.com/posts/1"
        guard let url = URL(string: jsonURLString) else { return }
        
        // Create a Session to visit the address specified above
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            // check the err or that the response == 200
        
            guard let data = data else { return }
            let dataAsString = String(data: data, encoding: .utf8)
            //print(dataAsString)
        
            // STEP 3 - Serialize the data
            do {
                // decode the JOSN and serialize -- Thanks Swit 4 ;)
                let item = try JSONDecoder().decode(Data.self, from: data)
                print(item.title)
            } catch let jsonErr {
                print("Error Serializing: ", jsonErr)
            }
        }.resume()
    }
    
    
    func arrayOfJSON() {
        
        // STEP 2 - Fetch JSON from endpoint
        let jsonURLString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: jsonURLString) else { return }
        
        // Create a Session to visit the address specified above
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            // check the err or that the response == 200
            
            guard let data = data else { return }
        
            // STEP 3 - Serialize the data
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data) // the bracket is important
                print(courses) // Prints an array of type JSON for Course items
            } catch let jsonErr {
                print("Error Serializing: ", jsonErr)
            }
        }.resume()
    }
    
    // 2 items outside an array of items
    func complexJSON() {
        
        let jsonURLString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        
    }
    
}
