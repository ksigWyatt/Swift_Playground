//
//  ViewController.swift
//  Auto Layout
//
//  Created by Wyatt Baggett on 10/30/17.
//  Copyright © 2017 Thrive Community Church. All rights reserved.
//

import UIKit

// Make your life easier by declaring an OO extension to UIColor for things that are used often
extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
    static var bgPink = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
}

// this view is becoming not needed - everything is added to the PageCell.swift file
// this was used as a simple creation ground for everything
class ViewController: UIViewController {

    // Adding a closure for the bear image view
    let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        
        // enables AutoLayout
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit // fit aspect for landscape + portrait
        return imageView
    }()
    
    // adding a closure for the textView
    let textDescriptor: UITextView = {
       let textView = UITextView()

        // New way of assigning text attributes using a Dict
        let attributedText = NSMutableAttributedString(string: "Join us today in our Fun & Games!",
               attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        
        // Add more text to the end of the above text
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.",
                            attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12),
                                         NSAttributedStringKey.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .center // centered
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    // Add previous button - private so that no other .swift classes can access this
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let pageControl: UIPageControl = {
       let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
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
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(textDescriptor) // add first line of text
        setupLayout() // Setup the images & top view
        setupBottomControls() // add buttons & Page Controller
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Making things more clean & OO
    func setupLayout() {
        // Add container to the top to make the graphic look nice
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        
        // enable autoLayout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5), // 0.5 = half the height
            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            
            // Leading anchors instead - Because the left / right is strange in some rare cases
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // This also must be added to the view BEFORE constraints can be added to it
        // otherwise you get an uncaught NSGenericException
        topImageContainerView.addSubview(bearImageView) //add image as a subview to the halved view
        
        NSLayoutConstraint.activate([
            // set constraints for X + Y
            bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            
            // add height / width constraints
            bearImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4), // Half the height of the top view
            
            // Add text constrints
            textDescriptor.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            textDescriptor.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
            // constant on right / opposite must be negative
            textDescriptor.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            textDescriptor.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //using FilePrivate because the init of the button is private - this preserves the privacy
    fileprivate func setupBottomControls() {
        
        // Using UI Stack view for adding buttons to the bottom - much more effiencent & easy
        let bottomControlsStackView = UIStackView(arrangedSubviews:
            [previousButton, pageControl, nextButton])
        
        bottomControlsStackView.distribution = .fillEqually // Tells thestack view to split
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
