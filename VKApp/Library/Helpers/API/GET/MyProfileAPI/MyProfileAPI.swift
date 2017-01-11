//
//  MyProfileAPI.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 11/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class MyProfileAPI: BaseAPI {
    
    override func method() -> HTTPMethod {
        return .get
    }
    
    override func path() -> String {
        return Constants.API.MyProfile
    }
    
    override func apiDidReturnData(data: AnyObject) {
        
        if let profile = Mapper<Profile>().map(JSONObject: data["response"] as! [String:AnyObject]) {
            super.apiDidReturnData(data: profile)
        }
        super.apiDidReturnData(data: data)
    }
}
