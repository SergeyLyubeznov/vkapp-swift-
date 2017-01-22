//
//  TestModel.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 22/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import ObjectMapper

class TestModel: BaseModel {

    var artistName:String?
    var collectionName:String?
    var trackName:String?
    
    override func mapping(map: Map) {
        artistName <- map["artistName"]
        collectionName <- map["collectionName"]
        trackName <- map["trackName"]
    }
}
