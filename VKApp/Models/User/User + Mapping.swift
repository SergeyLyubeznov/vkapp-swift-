//
//  User + Mapping.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 14/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import Foundation
import ObjectMapper


extension User {
    
    func executeMapping(map: Map) {
        
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
        nickname <- map["nickname"]
        domain <- map["phone"]
        photo200 <- map["photo_200"]
        photo100 <- map["photo_100"]
        photoId <- map["photo_id"]
        hasPhoto <- map["has_photo"]
        hasMobile <- map["has_mobile"]
        isFriend <- map["is_friend"]
        friendStatus <- map["friend_status"]
        online <- map["online"]
        mobilePhone <- map["mobile_phone"]
        homePhone <- map["home_phone"]
        site <- map["site"]
        lastSeen <- map["last_seen"]
        isDeactivated <- map["deactivated"]
        counters <- map["counters"]
    }
}
