//
//  Photo.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 25/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import ObjectMapper

class Photo: BaseModel, Observable {
    
    internal var observers:[ObserverObject] = []
    
    var preview:String?
    var original:String?
    
    var image:UIImage? {
        didSet{
            
            for observerObject in observers {
                observerObject.object?.objectDidChange(object: self)
            }
        }
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        preview <- map["photo_75"]
        original <- map["photo_604"]
        original <- map["photo_807"]
        original <- map["photo_1280"]
        
    }
    
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return  lhs.preview == rhs.preview &&
            lhs.original == rhs.original &&
            lhs.image == rhs.image
    }
    
    
    
    func addObserver(observer:ObserverObject) {
        observers.append(observer)
    }
    
    func removeObserver(observer:ObserverObject) {
        observers.remove(object: observer)
    }
    
    func removeAllObservers() {
        observers.removeAll()
    }
}
