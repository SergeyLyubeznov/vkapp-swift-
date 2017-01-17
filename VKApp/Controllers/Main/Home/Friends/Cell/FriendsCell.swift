//
//  FriendsCell.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 17/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import SDWebImage

class FriendsCell: BaseTableViewCell {
    
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var onineView:UIView!
    @IBOutlet weak var avatarImageView:UIImageView!
    
    override func updateUI() {
        
        guard let user = object as? User else {
            return
        }
        
        nameLabel.text = user.fullName()
        onineView.isHidden = !user.online
        
        if let imageName = user.photo100 {
            let downloader = SDWebImageDownloader.shared()
            downloader?.downloadImage(with: URL(string:imageName), options:SDWebImageDownloaderOptions.useNSURLCache,
                                      progress: nil, completed: { (image, data, error, result) in
                                        
                                        DispatchQueue.main.async {
                                            self.avatarImageView.image = image
                                        }
            })
        }
    }

}
