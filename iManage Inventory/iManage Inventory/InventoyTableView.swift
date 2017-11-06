//
//  FirstViewController.swift
//  iManage Inventory
//
//  Created by Wyatt Baggett on 11/6/17.
//  Copyright © 2017 Wyatt Baggett. All rights reserved.
//

import UIKit

class InventoryTableView: UITableViewController {
    
    var selectedRow: Int? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add,
                                        target: self,
                                        action: #selector(addNewItem(_:)))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    @objc func addNewItem(_ sender: AnyObject) {

        self.performSegue(withIdentifier: "updateItems", sender: self)
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: "updateItems", sender: self)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? UpdateItemViewController {
            if selectedRow == nil {
                vc.item = Item(id: UUID(), number: 0, description: "New Item", comments: "", quantity: 0)
            }
            else {
                vc.item = StoreItems.items[selectedRow!]
            }
            selectedRow = nil
        }
    }
    
}
