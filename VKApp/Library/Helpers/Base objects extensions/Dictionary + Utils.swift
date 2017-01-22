//
//  Dictionary + Utils.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 22/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

extension Dictionary {
    
    func stringFromHttpParameters() -> String {
        let parameterArray = self.map { (key, value) -> String in
            
            let key = (key as! String)
            let value = (value as! String)
            return "\(key)=\(value)"
        }
        
        return parameterArray.joined(separator: "&")
    }
}
