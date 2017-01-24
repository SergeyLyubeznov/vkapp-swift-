//
//  Array + Utils.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 24/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

extension Array {
    
    func convertElementsToStrings() -> [String] {
        
        return map{String(describing: $0)}
    }
}
