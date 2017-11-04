//
//  PageCell.swift
//  Auto Layout
//
//  Created by Wyatt Baggett on 11/4/17.
//  Copyright © 2017 Thrive Community Church. All rights reserved.
//

import UIKit

// custom cell - basically each VC & Customize each one
class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            // use a guard to avoid a crash from forced unwrapping the name if it's nil
            guard let unwrappedPage = page else { return }
            bearImageView.image = UIImage(named: unwrappedPage.imageName)
        }
    }
    
    // Adding a closure for the bear image view
    private let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        
        // enables AutoLayout
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit // fit aspect for landscape + portrait
        return imageView
    }()
    
    // adding a closure for the textView
    private let textDescriptor: UITextView = {
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
    
    // register the custom cell
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    // required for code to compile - throws error if something bad happens 'mkay
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupLayout() {
        // Add container to the top to make the graphic look nice
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        
        // enable autoLayout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5), // 0.5 = half the height
            topImageContainerView.topAnchor.constraint(equalTo: topAnchor),
            
            // Leading anchors instead - Because the left / right is strange in some rare cases
            topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
        
        // This also must be added to the view BEFORE constraints can be added to it
        // otherwise you get an uncaught NSGenericException
        topImageContainerView.addSubview(bearImageView) //add image as a subview to the halved view
        addSubview(textDescriptor)
        NSLayoutConstraint.activate([
            // set constraints for X + Y
            bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            
            // add height / width constraints
            bearImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4), // Half the height of the top view
            
            
//            // Add text constrints
            textDescriptor.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            textDescriptor.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),

            // constant on right / opposite must be negative
            textDescriptor.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            textDescriptor.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
}
