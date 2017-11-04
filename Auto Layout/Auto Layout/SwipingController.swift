//
//  swipingController.swift
//  Auto Layout
//
//  Created by Wyatt Baggett on 11/4/17.
//  Copyright © 2017 Thrive Community Church. All rights reserved.
//

import UIKit

// CONTROLLER
// controls the each cell and how they are controlled
class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    // don't just use Arrays - they crash easily if there are too few or many cells vs count    
    let pages = [
        Page(imageName: "bear_first",
             headerText: "Join us today in our Fun & Games!",
             bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        Page(imageName: "heart_second",
             headerText: "Subscribe & get coupons on our daily events",
             bodyText: "Get notified of the savings imediately when we announce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "leaf_third",
             headerText: "VIP members special services",
             bodyText: "")
    ]
    
    // Add previous button - private so that no other .swift classes can access this
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    // Dots at the bottom for viewing the page we are on & what not
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count // access member of your class thanks to lazy var
        pc.currentPageIndicatorTintColor = UIColor.mainPink
        pc.pageIndicatorTintColor = UIColor.bgPink
        return pc
    }()
    
    // Add previous button - private so that no other .swift classes can access this
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.mainPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    // next button handler
    @objc private func handleNext() {

        // protect the crash for the 4 pages when 3 are visible
        // uses min so we dont end up on page 4 of 3
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1) // use the pc value for the value for what page we are on
        pageControl.currentPage = nextIndex // reset value for pc.current
        let indexPath = IndexPath(item: nextIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    // previous button handler
    @objc private func handlePrev() {
        
        // protect the crash for the 4 pages when 3 are visible
        // uses max so we dont end up on page -1
        let nextIndex = max(pageControl.currentPage - 1, 0) // use the pc value for the value for what page we are on
        pageControl.currentPage = nextIndex // reset value for pc.current
        let indexPath = IndexPath(item: nextIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                            withVelocity velocity: CGPoint,
                                            targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        let pageID = x / view.frame.width // this is kinda cool
        pageControl.currentPage = Int(pageID) // set the dot to be the current page
    }
    
    
    // MARK: Start
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        
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
        
        return cell
    }
    
    // set the collection view to take the entire size of the screen
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
            UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    //using FilePrivate because the init of the button is private - this preserves the privacy
    fileprivate func setupBottomControls() {
        
        // Using UI Stack view for adding buttons to the bottom - much more effiencent & easy
        let bottomControlsStackView = UIStackView(arrangedSubviews:
            [previousButton, pageControl, nextButton])
        
        bottomControlsStackView.distribution = .fillEqually // Tells the stack view to split
        view.addSubview(bottomControlsStackView)
        
        // enable autoLayout
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Easier way of activating constraints - I like this more
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), // safe for landscape
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
}
