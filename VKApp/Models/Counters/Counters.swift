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
    var videos:UInt = 0 {didSet{if videos > 0 {items.append(CounterItem(title:"Video",name:"Видео",count:self.videos))}}}
    var audios:UInt = 0 {didSet{if audios > 0 {items.append(CounterItem(title:"Audio",name:"Аудио",count:self.audios))}}}
    var notes:UInt = 0
    var photos:UInt = 0 {didSet{if photos > 0 {items.append(CounterItem(title:"Photo",name:"Фото",count:self.photos))}}}
    var groups:UInt = 0 {didSet{if groups > 0 {items.append(CounterItem(title:"Groups",name:"Группы",count:self.groups))}}}
    var gifts:UInt = 0 {didSet{if gifts > 0 {items.append(CounterItem(title:"Gifts",name:"Подарки",count:self.gifts))}}}
    var friends:UInt = 0 {didSet{if friends > 0 {items.append(CounterItem(title:"Friends",name:"Друзья",count:self.friends))}}}
    var onlineFriends:UInt = 0 {didSet{if onlineFriends > 0 {items.append(CounterItem(title:"Online_friends",name:"Онлайн",count:self.onlineFriends))}}}
    var mutualFriends:UInt = 0 {didSet{if mutualFriends > 0 {items.append(CounterItem(title:"Mutual_friends",name:"Общие",count:self.mutualFriends))}}}
    var userPhotos:UInt = 0
    var userVideos:UInt = 0
    var followers:UInt = 0 {didSet{if followers > 0 {items.append(CounterItem(title:"Followers",name:"Подписчики",count:self.followers))}}}
    var subscriptions:UInt = 0
    var pages:UInt = 0
    
    override func mapping(map: Map) {
        
        friends <- map["friends"]
        followers <- map["followers"]
        onlineFriends <- map["online_friends"]
        mutualFriends <- map["mutual_friends"]
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
