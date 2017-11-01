//
//  ViewController.swift
//  Auto Layout
//
//  Created by Wyatt Baggett on 10/30/17.
//  Copyright © 2017 Thrive Community Church. All rights reserved.
//

import UIKit

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
        textView.text = "Join us today in our Fun & Games!"
        textView.font = UIFont.boldSystemFont(ofSize: 18) // bold
        textView.textAlignment = .center // centered
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(textDescriptor) // add first line of text
        
        setupLayout()
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
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true // 0.5 = half the height
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        // Leading anchors instead - Because the left / right is strange in some rare cases
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
     
        topImageContainerView.addSubview(bearImageView) //add image as a subview to the halved view
     
        // set constraints for X + Y
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true

        // add height / width constraints
        bearImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true // Half the height of the top view
        
        // Add text constrints
        textDescriptor.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        textDescriptor.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        textDescriptor.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        textDescriptor.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
