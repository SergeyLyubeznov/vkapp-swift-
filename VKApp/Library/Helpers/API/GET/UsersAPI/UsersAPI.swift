//
//  UsersAPI.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 24/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class UsersAPI: UserAPI {
    
    override func parameters() -> [String : Any] {
        var param = super.parameters()
        param["fields"] = Constants.API.FriendsUserFields
        return param
    }

}
