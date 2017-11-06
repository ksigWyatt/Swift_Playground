//
//  FirstViewController.swift
//  iManage Inventory
//
//  Created by Wyatt Baggett on 11/6/17.
//  Copyright © 2017 Wyatt Baggett. All rights reserved.
//

import UIKit

class InventoryTableView: UITableViewController {
    
    var items: [String] = [String]()
    var currentIndex: Int = 0
    let newItem = "New  Item"
    let itemTitle: String = "item"
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        loadDummyData()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add,
                                        target: self,
                                        action: #selector(addNewItem(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        
    }
    
    @objc func addNewItem(_ sender: AnyObject) {

        // If there's no items OR there is not an item called "New Item"
        if items.count == 0 || items[0] != newItem {

            items.insert(newItem, at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
            saveViewState()
        }
        currentIndex = 0
        self.performSegue(withIdentifier: "updateItems", sender: self)
    }
    
    //
    func saveViewState() {
        UserDefaults.standard.set(items, forKey: itemTitle)
        UserDefaults.standard.synchronize()
    }
    
    //
    func loadDummyData() {
        
    }
    
}
