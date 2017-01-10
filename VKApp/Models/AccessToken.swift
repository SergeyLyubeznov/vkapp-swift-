//
//  AccessToken.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 10/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class AccessToken: NSObject {
    var token:String?
    var expires:String?
    var userId:String?
    
    init(with dict:[String:String]) {
        self.token = dict["access_token"]
        self.expires = dict["expires_in"]
        self.userId = dict["user_id"]
    }
}
