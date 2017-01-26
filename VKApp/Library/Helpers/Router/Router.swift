//
//  Router.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 17/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

enum ControllerType:String {
    case friends = "Friends", news = "News", groups = "Groups",
    profile = "Profile", onlineFriends = "OnlineFriends", mutualFriends = "MutualFriends", followers = "Followers", photos = "Photos"
}

class Router: NSObject {

    class func getController(controllerType:ControllerType) -> BaseViewController {
        
        let appName = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
        let controllerName = appName+"."+controllerType.rawValue+"ViewController"
        let aClass = NSClassFromString(controllerName) as? BaseViewController.Type

        guard let controller = aClass?.controller() as? BaseViewController else {
            return BaseViewController()
        }
        
        return controller
    }
    
}
