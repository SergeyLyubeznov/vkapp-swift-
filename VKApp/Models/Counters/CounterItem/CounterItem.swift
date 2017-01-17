//
//  CounterItem.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 17/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class CounterItem {

    var name:String?
    var title:String?
    var count:UInt = 0
    
    init () {}
    
    convenience init(title:String,name:String, count:UInt) {
        self.init()
        
        self.name = name
        self.title = title
        self.count = count
    }
}
