//
//  Photo.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 25/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import ObjectMapper

class Photo: BaseModel {

    var preview:String?
    var original:String?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        preview <- map["photo_75"]
        original <- map["photo_604"]
        original <- map["photo_807"]
        original <- map["photo_1280"]
        
    }
}
