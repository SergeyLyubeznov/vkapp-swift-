//
//  BaseModel.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 11/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import ObjectMapper

class BaseModel: NSObject, Mappable {

    var id: UInt = 0
    
    required override init() {
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
    }
}
