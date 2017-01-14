//
//  ProfileUserInfoCell.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 14/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class ProfileUserInfoCell: BaseTableViewCell {

    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var cityLabel:UILabel!
    @IBOutlet weak var bdayLabel:UILabel!
    @IBOutlet weak var statusLabel:UILabel!
    @IBOutlet weak var backgroundImageView:UIImageView!
    @IBOutlet weak var avatarImageView:UIImageView!
    
    override func updateUI() {
        
        guard let profile = object as? Profile else {
            return
        }
        
        guard let user = profile.user else {
            return
        }
        
        nameLabel.text = user.fullName()
        cityLabel.text = String(format:"г. %@",(user.city?.title)!)
        
        if let bdate = user.bdate {
            bdayLabel.text = bdate
        }
        
        if let status = user.status {
            statusLabel.text = status
        }
        
        if let imageName = user.photo {
            //add load image
        }
        
    }
}
