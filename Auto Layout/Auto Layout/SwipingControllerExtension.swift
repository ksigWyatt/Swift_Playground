//
//  SwipingControllerExtension.swift
//  Auto Layout
//
//  Created by Wyatt Baggett on 11/4/17.
//  Copyright © 2017 Thrive Community Church. All rights reserved.
//

import UIKit

// Cleaning up the Controller class 
extension SwipingController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // using coordinator to preserve the index of the item for the page that we are on
        // while transitioning this fires
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            // Check for issues with the pages & correct them - namely the first page
            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            }
            // small bug here on iPhone 8 when turning to landscape and back on the third page
            else {
                // scroll to correct index while transitioning
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }) { (_) in
        }
    }
}
