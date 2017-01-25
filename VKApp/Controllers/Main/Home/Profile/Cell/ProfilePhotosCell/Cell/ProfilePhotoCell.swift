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
    
    override func updateUI() {
        
        guard let photo = object as? Photo else {
            return
        }
        
        if let imageName = photo.preview {
            let downloader = SDWebImageDownloader.shared()
            downloader?.downloadImage(with: URL(string:imageName), options:SDWebImageDownloaderOptions.useNSURLCache,
                                      progress: nil, completed: { (image, data, error, result) in
                                        
                                        DispatchQueue.main.async {
                                            self.photoImageView.image = image
                                        }
            })
        }
    }
}
