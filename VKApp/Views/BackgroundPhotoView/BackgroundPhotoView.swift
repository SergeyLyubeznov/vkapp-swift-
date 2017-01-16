//
//  BackgroundPhotoView.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 17/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class BackgroundPhotoView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let opacityView = UIView()
        opacityView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        addSubview(opacityView)
        
        NSLayoutConstraint(item: opacityView, attribute: .leading, relatedBy: .equal, toItem: self,
                           attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: opacityView, attribute: .bottom, relatedBy: .equal, toItem: self,
                           attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: opacityView, attribute: .top, relatedBy: .equal, toItem: self,
                           attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: opacityView, attribute: .trailing, relatedBy: .equal, toItem: self,
                           attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
        
        opacityView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    var blurred:Bool? = false
    
    override var image: UIImage? {
        didSet{
            
            if image == nil {
                blurred = false
                return
            }
            
            if blurred == false {
                
                DispatchQueue.global(qos: .background).async {
                    
                   let blurImage = self.image!.blurImageRadius(blurRadius: 10)
                    
                    // Go back to the main thread to update the UI
                    DispatchQueue.main.async {
                        self.blurred = true
                        self.image = blurImage
                    }
                }
                
            }
        }
    }

}
