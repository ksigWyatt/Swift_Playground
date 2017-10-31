//
//  ViewController.swift
//  Auto Layout
//
//  Created by Wyatt Baggett on 10/30/17.
//  Copyright © 2017 Thrive Community Church. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the background color for the view
//        view.backgroundColor = .yellow
        
        // Set an image to stay inside of a UIImageView
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        view.addSubview(imageView) //add image as a subview
        //imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100) // set position + size
        
        // enables the following constraints
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // set constraints for X + Y
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        // add image to be 100px from the top instead
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        // add height / width constraints
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

