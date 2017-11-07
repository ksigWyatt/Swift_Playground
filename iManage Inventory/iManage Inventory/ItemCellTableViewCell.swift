//
//  ItemCellTableViewCell.swift
//  iManage Inventory
//
//  Created by Wyatt Baggett on 11/6/17.
//  Copyright © 2017 Wyatt Baggett. All rights reserved.
//

import UIKit

class ItemCellTableViewCell: UITableViewCell {

    @IBOutlet weak var partNumber: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var quantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
