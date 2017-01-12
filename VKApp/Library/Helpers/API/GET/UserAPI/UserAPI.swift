//
//  UserAPI.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 12/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class UserAPI: BaseAPI {
    
    override func method() -> HTTPMethod {
        return .get
    }
    
    override func path() -> String {
        return Constants.API.GetUser
    }
    
    override func parameters() -> [String : Any] {
        
        let userId = object as! String
        
        var param = super.parameters()
        param["fields"] = Constants.API.UserFields
        param["user_ids"] = userId
        param["name_case"] = "nom"
        
        return param
    }
    
    override func apiDidReturnData(data: AnyObject) {
        
        if let user = Mapper<User>().mapArray(JSONArray: data["response"] as! [[String:Any]]) {
            super.apiDidReturnData(data: user as AnyObject)
        }
        super.apiDidReturnData(data: data)
    }

}
