//
//  MeAPI.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 11/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import Alamofire

class MeAPI: BaseAPI {

    override func method() -> HTTPMethod {
        return .get
    }
    
    override func path() -> String {
        return Constants.API.MePath
    }
    
    override func apiDidReturnData(data: AnyObject) {
        print (data)
        super.apiDidReturnData(data: data)
    }
}
