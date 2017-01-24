//
//  Constants.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 10/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import Foundation
import UIKit



struct Constants {
    
    struct Permissions {
        static let PrintDeinit = true
    }
    
    struct Colors {
        static let BarTintColor = "#000000"
        static let TintColor = "#ffffff"
    }
    
    struct Controllers {
        
        struct TabTitle {

            static let Add = "Добавить"
            static let Friends = "Друзья"
            static let Settings = "Настройки"
            static let Home = "Домой"
            static let Messages = "Сообщения"
            static let Profile = "Я"
        }
        
        struct TabImage {
            static let Add = "add_tab_icon"
            static let Friends = "friends_tab_icon"
            static let Settings = "settings_tab_icon"
            static let Home = "home_tab_icon"
            static let Messages = "messages_tab_icon"
            static let Profile = "user_tab_icon"
        }
        
        struct TabSelectedImage {
            static let value = "_fill"
        }
    }
    
    struct API {
        
        static let AppId = "4933789"
        static let UserScope = "friends,offline"
        static let vkVersion = "5.8"
        static let BaseURL = "https://api.vk.com/method/"
        static let MyProfile = "account.getProfileInfo"
        static let GetUser = "users.get"
        static let GetOnlineFriends = "friends.getOnline"
        static let GetFriends = "friends.get"
        
        
        static let FriendsUserFields = "photo_100, last_seen, online"
        static let UserFields = "photo_id, verified, sex, bdate, city, counters, country, home_town, has_photo, photo_200, online, lists, domain, has_mobile, contacts, site, education, universities, schools, status, last_seen, followers_count, common_count, occupation, nickname, relatives, relation, personal, connections, exports, wall_comments, activities, interests, music, movies, tv, books, games, about, quotes, can_post, can_see_all_posts, can_see_audio, can_write_private_message, can_send_friend_request, is_favorite, is_hidden_from_feed, timezone, screen_name, maiden_name, is_friend, friend_status, career, military, blacklisted, blacklisted_by_me"
    }
    
    struct Strings {
        static let Online = "Онлайн"
        static let Offline = "Оффлайн"
        struct LastSeen {
            static let Male = "Последний раз был"
            static let Female = "Последний раз была"
        }
    }

}
