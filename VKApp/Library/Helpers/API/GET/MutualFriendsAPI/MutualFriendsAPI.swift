//
//  MutualFriendsAPI.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 25/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class MutualFriendsAPI: OnlineFriendsAPI {
    
    override func path() -> String {
        return Constants.API.GetMutualFriends
    }

    override func parameters() -> [String : Any] {
        
        let userId = object as! String
        
        var param = super.parameters()
        param["target_uid"] = userId
        
        return param
    }
}
