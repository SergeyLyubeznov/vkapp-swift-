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
    @IBOutlet weak var lastSeenLabel:UILabel!
    @IBOutlet weak var cityLabel:UILabel!
    @IBOutlet weak var bdayLabel:UILabel!
    @IBOutlet weak var statusLabel:UILabel!
    @IBOutlet weak var backgroundImageView:BackgroundPhotoView!
    @IBOutlet weak var avatarImageView:UIImageView!
    
    override func updateUI() {
        
        guard let user = object as? User else {
            return
        }
        
        if let city = user.city {
            cityLabel.text = String(format:"г. %@",(city.title)!)
        }
        
        nameLabel.text = user.fullName()
        
        if let bdate = user.bdate {
            bdayLabel.text = bdate
        }
        
        if let status = user.status {
            statusLabel.text = status
        }
        
        lastSeenLabel.isHidden = user.online
        
        if user.lastSeen != nil {
            
            var text = (user.genderType == GenderType.male) ? Constants.Strings.LastSeen.Male : Constants.Strings.LastSeen.Female
            let date = user.stringDate()
            text += " \(date)"
            lastSeenLabel?.text = text
            
        }
        
        if (user.photo200 != nil) && avatarImageView.image == nil {
            ImageManager.loadImageAt(url: URL(string:user.photo200!)!, completion: { (image) in
                self.avatarImageView.display(image:image!, isAnimation: true)
                self.backgroundImageView.display(image:image!, isAnimation: true)
            })
        }
    }
}
