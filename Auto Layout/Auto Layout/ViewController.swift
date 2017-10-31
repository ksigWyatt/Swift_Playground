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
        return imageView
    }()
    
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
        // set the background color for the view
        // view.backgroundColor = .yellow
        
        view.addSubview(bearImageView) //add image as a subview
        view.addSubview(textDescriptor) // add first line of text
        
        setupLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Making things more clean & OO
    func setupLayout() {
        // set constraints for X + Y
        bearImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
   
        // add image to be 100px from the top instead
        bearImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    
        // add height / width constraints
        bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bearImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        // Add text constrints
        textDescriptor.topAnchor.constraint(equalTo: bearImageView.bottomAnchor, constant: 120).isActive = true
        textDescriptor.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        textDescriptor.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        textDescriptor.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }

}
