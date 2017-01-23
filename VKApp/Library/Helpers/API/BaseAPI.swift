//
//  BaseAPI.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 10/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

enum HTTPMethod:String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

class BaseAPI: NSObject {
    
    var completion:((_ data:AnyObject?, _ erorr:Error?) -> Void)?
    
    var object:AnyObject?
    
    var addAccessToken = true

    public func startRequest(completion:@escaping (_ data: AnyObject?,_ error:Error?) -> Void) {
        
        let method = self.method()
        var parameters = self.parameters()
        let baseUrl:String = Constants.API.BaseURL + self.path()
        self.completion = completion
        
        if addAccessToken {
            let token = AppManager.sharedInstance.accessToken
            parameters["access_token"] = token.token
        }
        
        let stringParam:String = parameters.stringFromHttpParameters()
        
        let resultUrl = baseUrl+"?\(stringParam)"
        
        guard let url = URL(string:resultUrl) else {return}
        
        var request = URLRequest.init(url: url)
        request.httpMethod = method.rawValue
        
        let session = URLSession(configuration: .default)
        var jsonObject:[String:Any]?
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                self.apiDidReturnError(error: error)
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                
                    do {
                        jsonObject = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as? [String:Any]
                    } catch {
                        return
                    }
                    if jsonObject != nil {
                        self.apiDidReturnData(data: jsonObject as AnyObject)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
    
    func apiDidReturnData(data:AnyObject) {
        
        DispatchQueue.main.async {
            if self.completion != nil {
                self.completion?(data,nil)
            }
        }

        
        
    }
    
    func apiDidReturnError(error:Error) {
        DispatchQueue.main.async {
            if self.completion != nil {
                self.completion?(nil,error)
            }
        }
    }
    
    func method() -> HTTPMethod {
        return .get
    }
    
    func parameters() -> [String:Any] {
        var parameters = [String:Any]()
        parameters["v"] = Constants.API.vkVersion
        return parameters
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
