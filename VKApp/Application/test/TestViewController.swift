//
//  TestViewController.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 22/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import ObjectMapper

class TestViewController: BaseViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    private func loadData() {
        
        let session = URLSession(configuration: .default)
        let baseUrl = "https://itunes.apple.com/"
        var jsonObject:[String:Any]?
        let method = "GET"
        let path = "search"
        
        var urlString =  baseUrl + path
        if parameters().count > 0 {
            urlString = urlString+"?\(parameters().stringFromHttpParameters())"
        }
        
        guard let url = URL(string:urlString) else {return}
        
        var request = URLRequest.init(url: url)
        request.httpMethod = method
        
        
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    let string:String = String.init(data: data!, encoding:String.Encoding.utf8)!
                    print(string)
                    
                    do {
                        jsonObject = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as? [String:Any]
                    } catch {
                        print(error)
                        return
                    }
                    
                    if jsonObject != nil {
                        let testModels = Mapper<TestModel>().mapArray(JSONObject:jsonObject?["results"])
                        print(testModels)
                    }
                    
                    
                }
                }
        }
        
        dataTask.resume()
    }

}

extension TestViewController {
    
    func parameters() -> [String:Any] {
        var param = [String:Any]()
    
        param["media"] = "music"
        param["entity"] = "song"
        param["term"] = "swift"
        
        return param
    }
}
