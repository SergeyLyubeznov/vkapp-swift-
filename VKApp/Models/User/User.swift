//
//  User.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 11/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import ObjectMapper

let genderNames = ["","Женский","Мужской"]

enum GenderType:Int {
    case none = 0, female = 1, male = 2
    var name:String {
        return genderNames[self.rawValue]
    }
}

class User: BaseModel {
    
    var firstName:String?
    var lastName:String?
    var maidenName:String?
    var screenName:String?
    var gender:Int = 0 {
        didSet{
            genderType = GenderType(rawValue: gender)
        }
    }
    var genderType:GenderType?
    var relation:Int = 0
    var bdate:String?
    var bdateVisibility:Int = 0
    var homeTown:String?
    var city:City?
    var country:Country?
    var status:String?
    var phone:String?
    
    func relationName() -> String {
        var string = ""
        switch relation {
            case 0:string = ""
            case 1:string = gender == 1 ? "Не замужем":"Не женат"
            case 2:string = gender == 1 ? "Есть друг":"Есть подруга"
            case 3:string = gender == 1 ? "Помолвлена":"Помолвлен"
            case 4:string = gender == 1 ? "Замужем":"Женат"
            case 5:string = "Все сложно"
            case 6:string = "В активном поиске"
            case 7:string = gender == 1 ? "Влюблена":"Влюблен"
            case 8:string = "В гражданском браке"
            default:string = ""
        }
        return string
    }
    
    override func mapping(map: Map) {
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        maidenName <- map["maiden_name"]
        screenName <- map["screen_name"]
        gender <- map["sex"]
        relation <- map["relation"]
        bdate <- map["bdate"]
        bdateVisibility <- map["bdate_visibility"]
        homeTown <- map["home_town"]
        city <- map["city"]
        country <- map["country"]
        status <- map["status"]
        phone <- map["phone"]
    }

}
