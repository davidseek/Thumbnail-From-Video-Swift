//
//  ViewController.swift
//  ThumbnailTestProject
//
//  Created by David Seek on 10/12/17.
//  Copyright © 2017 David Seek. All rights reserved.
//


import UIKit


class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
    }

    @IBAction func getThumbnailButtonPressed(_ sender: Any) {
        
        PhotoServices.shared.getVideoFromCameraRoll(on: self) { url in
            let thumbnail = PhotoServices.shared.getThumbnailFrom(path: url)
            self.imageView.image = thumbnail
        }
        
    }
    
    
    
}

