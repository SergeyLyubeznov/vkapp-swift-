//
//  Counters.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 17/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit
import ObjectMapper

class Counters: BaseModel {
    
    var items:[CounterItem] = []
    
    var albums:UInt = 0
    var videos:UInt = 0 {didSet{if videos > 0 {items.append(CounterItem(title:"Видео",count:self.videos))}}}
    var audios:UInt = 0 {didSet{if audios > 0 {items.append(CounterItem(title:"Аудио",count:self.audios))}}}
    var notes:UInt = 0
    var photos:UInt = 0 {didSet{if photos > 0 {items.append(CounterItem(title:"Фото",count:self.photos))}}}
    var groups:UInt = 0 {didSet{if groups > 0 {items.append(CounterItem(title:"Группы",count:self.groups))}}}
    var gifts:UInt = 0 {didSet{if gifts > 0 {items.append(CounterItem(title:"Подарки",count:self.gifts))}}}
    var friends:UInt = 0 {didSet{if friends > 0 {items.append(CounterItem(title:"Друзья",count:self.friends))}}}
    var onlineFriends:UInt = 0 {didSet{if onlineFriends > 0 {items.append(CounterItem(title:"Онлайн",count:self.onlineFriends))}}}
    var mutualFriends:UInt = 0 {didSet{if mutualFriends > 0 {items.append(CounterItem(title:"Общие",count:self.mutualFriends))}}}
    var userPhotos:UInt = 0
    var userVideos:UInt = 0
    var followers:UInt = 0 {didSet{if followers > 0 {items.append(CounterItem(title:"Подписчики",count:self.followers))}}}
    var subscriptions:UInt = 0
    var pages:UInt = 0
    
    override func mapping(map: Map) {
        
        friends <- map["friends"]
        onlineFriends <- map["online_Friends"]
        mutualFriends <- map["mutual_friends"]
        followers <- map["followers"]
        photos <- map["photos"]
        videos <- map["videos"]
        audios <- map["audios"]
        groups <- map["groups"]
        gifts <- map["gifts"]
        albums <- map["albums"]
        notes <- map["notes"]
        userPhotos <- map["user_photos"]
        userVideos <- map["user_videos"]
        subscriptions <- map["subscriptions"]
        pages <- map["pages"]
    }
}
