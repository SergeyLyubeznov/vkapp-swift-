//
//  Country.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 12/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import ObjectMapper

class Country: BaseModel {

    var title:String?
    
    override func mapping(map: Map) {
        title <- map["title"]
        id <- map["cid"]
    }
}
