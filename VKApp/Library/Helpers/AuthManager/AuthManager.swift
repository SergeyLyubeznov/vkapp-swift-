//
//  AuthManager.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 10/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class AuthManager: NSObject {
    
        let request = { () -> URLRequest in
    
        let appId = Constants.API.AppId
        let scope = Constants.API.UserScope
        let version = Constants.API.vkVersion
        
        let stringUrl = "https://oauth.vk.com/authorize?client_id="+appId+"&display=page&redirect_uri=https://oauth.vk.com/blank.html&scope="+scope+"&response_type=token&v="+version;
        return URLRequest.init(url: URL.init(string:stringUrl)!)
    }
    
    func getAccessToken(path:String?) -> AccessToken {
        
        var dict = [String:String]()
        
        var string = path
        
        if let array = string?.components(separatedBy: "#") {
            string = array.last
            if let array2 = string?.components(separatedBy: "&") {
                for valueString in array2 {
                    let array3 = valueString.components(separatedBy: "=")
                    dict[array3.first!] = array3.last
                }
                print(dict)
            }
        }
        
        let accessToken = AccessToken(with:dict)

        return accessToken
    }

}
