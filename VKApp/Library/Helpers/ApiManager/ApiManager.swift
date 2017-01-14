//
//  ApiManager.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 11/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class ApiManager: NSObject {
    
    class func loadProfile(completion:@escaping (_ profile: Profile?) -> Void) {
        
        let myProfileAPI = MyProfileAPI()
        myProfileAPI.startRequest { (data, error) in
            
            if let profile = data as? Profile {
                let userId = AppManager.sharedInstance.accessToken.userId
                profile.id = UInt(userId!)!
                
                let userAPI = UserAPI()
                userAPI.object = userId as AnyObject?
                userAPI.startRequest{ (data, error) in
                    
                    guard let array = data as? Array<User> else {
                        return
                    }
                    
                    if let user = array.first {
                        profile.user = user
                        completion(profile)
                    }
                }
            }
        }
    }
}
