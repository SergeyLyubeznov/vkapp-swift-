//
//  LastSeen.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 12/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import ObjectMapper

class LastSeen: BaseModel {

    var time:TimeInterval?
    var platform:Int = 0
    
    override func mapping(map: Map) {
        time <- map["time"]
        platform <- map["platform"]
    }
}
