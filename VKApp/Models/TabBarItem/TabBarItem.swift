//
//  TabBarItem.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 11/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class TabBarItem: NSObject {
    var title:String?
    var imageName:String? {
        didSet {
            if imageName != nil {
                selectedImageName = imageName! + "_fill"
            }
        }
    }
    var selectedImageName:String?
}
