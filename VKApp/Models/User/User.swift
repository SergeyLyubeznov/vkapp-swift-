//
//  User.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 11/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import ObjectMapper

class User: BaseModel {
    
    var firstName:String?
    var lastName:String?
    
     override func mapping(map: Map) {
        firstName <- map["first_name"]
        lastName <- map["last_name"]
    }

}
