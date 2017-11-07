//
//  Item.swift
//  iManage Inventory
//
//  Created by Wyatt Baggett on 11/6/17.
//  Copyright © 2017 Wyatt Baggett. All rights reserved.
//

import Foundation

struct Item {
    let id: UUID
    var number: Int
    var description: String
    var comments: String
    var quantity: Int
}
