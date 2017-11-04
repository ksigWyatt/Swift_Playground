//
//  swipingController.swift
//  Auto Layout
//
//  Created by Wyatt Baggett on 11/4/17.
//  Copyright © 2017 Thrive Community Church. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .green
        // add this line to prevent NSInternalInconsistencyException & register cells
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        
    }
    
    // section - An index number identifying a section in collectionView. 
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    // add cells for the sections above
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt
                                 indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId",
                                                         for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}
