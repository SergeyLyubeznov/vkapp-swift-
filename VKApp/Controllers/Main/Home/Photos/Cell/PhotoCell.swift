//
//  PhotoCell.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 26/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class PhotoCell: BaseCollectionViewCell {

    @IBOutlet weak var photoImageView:UIImageView!
    @IBOutlet weak var activityIndicator:UIActivityIndicatorView!
    
    override func updateUI() {
     
        guard let photo = object as? Photo else {
            return
        }
        
        if let imageName = photo.original {
            photoImageView.image = nil
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            ImageManager.loadImageAt(url: URL(string:imageName)!, completion: { (image) in
                photo.image = image
                self.photoImageView.image = image
                self.activityIndicator.stopAnimating()
            })
        }
    }
}