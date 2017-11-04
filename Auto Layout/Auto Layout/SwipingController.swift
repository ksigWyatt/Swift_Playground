//
//  swipingController.swift
//  Auto Layout
//
//  Created by Wyatt Baggett on 11/4/17.
//  Copyright © 2017 Thrive Community Church. All rights reserved.
//

import UIKit

struct Page {
    let imageName: String
    let headerText: String
}

// controls the each cell and how they are controlled
class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    // don't just use Arrays - they crash easily if there are too few or many cells vs count
//    let imageNames = ["bear_first", "heart_second", "leaf_third"]
//    let headerStrings = ["Join us today in our Fun & Games!",
//                         "Subscribe & get coupons for our daily events",
//                         "VIP members special services"]
    
    let pages = [
        Page(imageName: "bear_first", headerText: "Join us today in our Fun & Games!"),
        Page(imageName: "heart_second", headerText: "Subscribe & get coupons for our daily events"),
        Page(imageName: "leaf_third", headerText: "VIP members special services")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        // add this line to prevent NSInternalInconsistencyException & register cells
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId") // adding custom View Cell - this is important too
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
        // OO # of pages
        return pages.count
    }
    
    // add cells for the sections above
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt
                                 indexPath: IndexPath) -> UICollectionViewCell {
        
        // access PageCell items - CASTING is important
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId",
                                                         for: indexPath) as! PageCell
        /*
           # of the row in the collection View
           following the modulo if the index path is divisibly by 2 then set the color to red else green
           nice little inline coonditionals using an optional *!!THIS IS IMPORTANT!!*
        
            cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        */
        
        // changes the image of the image view declared in bearImageView to change it based
        // on the image found at the name in the global struct of Pages
        let page = pages[indexPath.item]
        cell.page = page // Swiping sets this page property
        
        
        
//        cell.bearImageView.image = UIImage(named: page.imageName)  // set image from name
//        cell.textDescriptor.text = page.headerText  // set bold text
        
        return cell
    }
    
    // set the collection view to take the entire size of the screen
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
            UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}
