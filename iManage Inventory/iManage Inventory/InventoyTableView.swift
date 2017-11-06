//
//  FirstViewController.swift
//  iManage Inventory
//
//  Created by Wyatt Baggett on 11/6/17.
//  Copyright © 2017 Wyatt Baggett. All rights reserved.
//

import UIKit

class InventoryTableView: UITableViewController {
    
    var cellItems: [String] = [String]()
    var currentIndex: Int = 0
    let newItem = "New  Item"
    let itemTitle: String = "item"
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        loadDummyData()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add,
                                        target: self,
                                        action: #selector(addNewItem(_:)))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addNewItem(_ sender: AnyObject) {

        // If there's no items OR there is not an item called "New Item"
        if cellItems.count == 0 || cellItems[0] != newItem {

            cellItems.insert(newItem, at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
            saveViewState()
        }
        currentIndex = 0
        self.performSegue(withIdentifier: "updateItems", sender: self)
    }
    
    //
    func saveViewState() {
        UserDefaults.standard.set(cellItems, forKey: itemTitle)
        UserDefaults.standard.synchronize()
    }
    
    //
    func loadDummyData() {
        
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return StoreItems.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemCellTableViewCell
        cell.partNumber.text = String(describing: StoreItems.items[indexPath.row].number)
        cell.desc.text = "\(StoreItems.items[indexPath.row].description)"
        cell.quantity.text = "\(StoreItems.items[indexPath.row].quantity)"
        return cell
    }
    
}
