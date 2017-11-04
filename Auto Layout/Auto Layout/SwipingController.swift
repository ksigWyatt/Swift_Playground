//
//  swipingController.swift
//  Auto Layout
//
//  Created by Wyatt Baggett on 11/4/17.
//  Copyright © 2017 Thrive Community Church. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        // add this line to prevent NSInternalInconsistencyException & register cells
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true // allows for snaps between the cells
        
    }
    
    // add spacing function for the cells to display properly w/out the while line
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
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
        /*
           # of the row in the collection View
           following the modulo if the index path is divisibly by 2 then set the color to red else green
           nice little inline coonditionals using an optional *!!THIS IS IMPORTANT!!*
        */ cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        
        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
            UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}
