//
//  FirstViewController.swift
//  iManage Inventory
//
//  Created by Wyatt Baggett on 11/6/17.
//  Copyright © 2017 Wyatt Baggett. All rights reserved.
//

import UIKit

class InventoryTableView: UITableViewController {
    
    var items: [Int] = [Int]()
    var currentIndex: Int = 0
    let newItem = "New  Item"
    let itemTitle: String = "item"
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        loadDummyData()
        
    }
    
//    @objc func addNewItem(_ sender: AnyObject) {
//
//        if objects.count == 0 || objects[0] != newItem {
//
//            objects.insert(newItem, at: 0)
//            let indexPath = IndexPath(row: 0, section: 0)
//            self.tableView.insertRows(at: [indexPath], with: .automatic)
//
//        }
//        saveViewState()
//
//        currentIndex = 0
//        self.performSegue(withIdentifier: "updateItems", sender: self)
//    }
//
//    func saveViewState() {
//        UserDefaults.standard.set(objects, forKey: itemTitle)
//        UserDefaults.standard.synchronize()
//    }
//

    func loadDummyData() {
        
    }
    
}
