//
//  BaseAPI.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 10/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import Alamofire

class BaseAPI: NSObject {
    
    var completion:((_ data:AnyObject?, _ erorr:Error?) -> Void)?
    
    var addAccessToken = true

    public func startRequest(completion:@escaping (_ data: AnyObject?,_ error:Error?) -> Void) {
        
        let method = self.method()
        var parameters = self.parameters()
        let url = Constants.API.BaseURL + self.path()
        self.completion = completion
        
        if addAccessToken {
            let token = AppManager.sharedInstance.accessToken
            parameters["access_token"] = token.token
        }
        
        Alamofire.request(url, method: method, parameters: parameters, headers: nil).responseJSON { response in
            
            if response.result.isSuccess {
                
                let dict = self.convertToDictionary(data: response.data!)
                
                self.apiDidReturnData(data: dict as AnyObject)
            } else {
                self.apiDidReturnError(error: response.result.value as! Error)
            }
        }
    }
    
    func apiDidReturnData(data:AnyObject) {
        if completion != nil {
            completion?(data,nil)
        }
    }
    
    func apiDidReturnError(error:Error) {
        if completion != nil {
            completion?(nil,error)
        }
    }
    
    func method() -> HTTPMethod {
        return .get
    }
    
    func parameters() -> [String:Any] {
        return [String:Any]()
    }
    
    func path() -> String {
        return ""
    }
    
    func convertToDictionary(data: Data) -> [String: Any]? {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        return nil
    }

    
}
