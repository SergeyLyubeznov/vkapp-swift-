//
//  PhotosAPI.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 25/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import ObjectMapper

class PhotosAPI: BaseAPI {
    
    override func path() -> String {
        return Constants.API.GetAllPhotos
    }
    
    override func parameters() -> [String : Any] {
        
        let userId = object as! String
        
        var param = super.parameters()
        param["owner_id"] = userId
        
        return param
    }
    
    override func apiDidReturnData(data: AnyObject) {
        
        let items = data["response"] as! [String : Any]
        
        if let photos = Mapper<Photo>().mapArray(JSONArray: items["items"] as! [[String:Any]]) {
            super.apiDidReturnData(data: photos as AnyObject)
        }
        
        super.apiDidReturnData(data: data)
    }


}
