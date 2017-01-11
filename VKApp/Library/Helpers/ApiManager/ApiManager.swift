//
//  ApiManager.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 11/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class ApiManager: NSObject {
    
    class func loadProfile() {
        
        let myProfileAPI = MyProfileAPI()
        myProfileAPI.startRequest { (data, error) in
            
            if let profile = data as? Profile {
                AppManager.sharedInstance.profile = profile
            }
        }
    }

}
