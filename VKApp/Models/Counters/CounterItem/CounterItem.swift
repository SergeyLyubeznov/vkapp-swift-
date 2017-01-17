//
//  CounterItem.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 17/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class CounterItem {

    var title:String?
    var count:UInt = 0
    
    init () {}
    
    convenience init(title:String, count:UInt) {
        self.init()
        
        self.title = title
        self.count = count
    }
}
