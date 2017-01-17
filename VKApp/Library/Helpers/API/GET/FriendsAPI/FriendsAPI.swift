
//
//  FriendsAPI.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 17/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class FriendsAPI: BaseAPI {
    
    override func method() -> HTTPMethod {
        return .get
    }
    
    override func path() -> String {
        return Constants.API.GetFriends
    }
    
    override func parameters() -> [String : Any] {
        
        let userId = object as! String
        
        var param = super.parameters()
        param["fields"] = Constants.API.FriendsUserFields
        param["user_id"] = userId
        param["name_case"] = "nom"
        param["order"] = "name"
//        param["count"] = 10
//        param["offset"] = 10
        
        
        return param
    }
    
    override func apiDidReturnData(data: AnyObject) {
        
        let items = data["response"] as! [String : Any]
        
        if let user = Mapper<User>().mapArray(JSONArray: items["items"] as! [[String:Any]]) {
            super.apiDidReturnData(data: user as AnyObject)
        }
        super.apiDidReturnData(data: data)
    }

}
