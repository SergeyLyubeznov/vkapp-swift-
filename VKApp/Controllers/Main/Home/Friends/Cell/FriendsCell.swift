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
    @IBOutlet weak var activityIndicator:UIActivityIndicatorView!
    
    override func updateUI() {
        
        guard let user = object as? User else {
            return
        }
        
        nameLabel.text = user.fullName()
        onineView.isHidden = !user.online
        
        if let imageName = user.photo100 {
            
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            avatarImageView.image = nil
            
            ImageManager.loadImageAt(url: URL(string:imageName)!, completion: { (image) in
                self.avatarImageView.image = image
                self.activityIndicator.stopAnimating()
            })
        }
    }

}
