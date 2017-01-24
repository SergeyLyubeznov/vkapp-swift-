//
//  OnlineFriendsAPI.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 24/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import ObjectMapper

class OnlineFriendsAPI: BaseAPI {

    override func method() -> HTTPMethod {
        return .get
    }
    
    override func path() -> String {
        return Constants.API.GetOnlineFriends
    }
    
    override func parameters() -> [String : Any] {
        
        let userId = object as! String
        
        var param = super.parameters()
        param["user_id"] = userId
        
        return param
    }
    
    override func apiDidReturnData(data: AnyObject) {
        
        if let userIds:[UInt] = data["response"] as? [UInt] {
            let stringIds = userIds.convertElementsToStrings()
            let string = stringIds.joined(separator: ",")
            super.apiDidReturnData(data: string as AnyObject)
        }
        super.apiDidReturnData(data: data)
    }
}
