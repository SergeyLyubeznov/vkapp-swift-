//
//  ProfileUserInfoCell.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 14/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileUserInfoCell: BaseTableViewCell {

    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var cityLabel:UILabel!
    @IBOutlet weak var bdayLabel:UILabel!
    @IBOutlet weak var statusLabel:UILabel!
    @IBOutlet weak var backgroundImageView:BackgroundPhotoView!
    @IBOutlet weak var avatarImageView:UIImageView!
    
    override func updateUI() {
        
        guard let user = object as? User else {
            return
        }
        
        print(user.counters)
        
        nameLabel.text = user.fullName()
        cityLabel.text = String(format:"г. %@",(user.city?.title)!)
        
        if let bdate = user.bdate {
            bdayLabel.text = bdate
        }
        
        if let status = user.status {
            statusLabel.text = status
        }
        
        if let imageName = user.photo {
            let downloader = SDWebImageDownloader.shared()
            downloader?.downloadImage(with: URL(string:imageName), options:SDWebImageDownloaderOptions.useNSURLCache,
                                      progress: nil, completed: { (image, data, error, result) in
                                        
                                        DispatchQueue.main.async {
                                            self.backgroundImageView.image = image
                                            self.avatarImageView.image = image
                                        }
            })
        }
    }
}
