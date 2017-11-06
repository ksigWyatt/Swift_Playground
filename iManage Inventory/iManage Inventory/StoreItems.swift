//
//  StoreItems.swift
//  iManage Inventory
//
//  Created by Wyatt Baggett on 11/6/17.
//  Copyright © 2017 Wyatt Baggett. All rights reserved.
//

import Foundation

struct StoreItems {
    static var items: [Item] = [Item(id: UUID(),number: 1,
                            description: "This is an example item used as a resource for teaching others aboue the system - please refrain from ediding it's contents.",
                            comments: "There is more that could be learned from this system if you really want to know more about it.",
                            quantity: 100),
                        Item(id: UUID(),
                             number: 100,
                             description: "Part of a larger system. This Larger system is larger than one might think. Some may even say it's larger than life.",
                             comments: "", quantity: 3)]
}
