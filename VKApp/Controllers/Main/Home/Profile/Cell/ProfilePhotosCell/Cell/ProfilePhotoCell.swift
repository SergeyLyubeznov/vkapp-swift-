//
//  ProfilePhotoCell.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 25/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import SDWebImage

class ProfilePhotoCell: BaseCollectionViewCell {

    @IBOutlet weak var photoImageView:UIImageView!
    @IBOutlet weak var activityIndicator:UIActivityIndicatorView!
    
    override func updateUI() {
        
        guard let photo = object as? Photo else {
            return
        }
        
        if let imageName = photo.preview {
            photoImageView.image = nil
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            ImageManager.loadImageAt(url: URL(string:imageName)!, completion: { (image) in
                self.photoImageView.image = image
                self.activityIndicator.stopAnimating()
            })
        }
    }
}
