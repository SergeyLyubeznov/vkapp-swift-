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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        activityIndicator.isHidden = true
    }
    
    override func updateUI() {
     
        guard let photo = object as? Photo else {
            return
        }
        
        
        if photo.image != nil {
            photoImageView.display(image: photo.image!, isAnimation: true)
            loadImage(imageName: photo.original!,photo:photo, completion: {_ in
            self.activityIndicator.stopAnimating()})
        } else {
            photoImageView.image = nil
            activityIndicator.isHidden = false
            loadImage(imageName: photo.preview!,photo:photo, completion: { (image) in
                self.activityIndicator.stopAnimating()
                self.loadImage(imageName: photo.original!,photo:photo, completion: {_ in })
            })
        }
    }
    
    private func loadImage(imageName:String,photo:Photo, completion:@escaping (_ image: UIImage?) -> Void) {

        ImageManager.loadImageAt(url: URL(string:imageName)!, completion: { (image) in
            photo.image = image
            let animation = self.photoImageView.image == nil
            self.photoImageView.display(image:image!, isAnimation: animation)
            completion(image)
        })
    }
}
