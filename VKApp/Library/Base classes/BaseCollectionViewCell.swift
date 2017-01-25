//
//  BaseCollectionViewCell.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 25/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
 
    var object:Any? {
        didSet {
            updateUI()
        }
    }
    
    var indexPath:IndexPath?
    
    func updateUI() {
        
    }
}
