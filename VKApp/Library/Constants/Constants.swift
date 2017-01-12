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
    
    struct API {
        
        static let AppId = "4933789"
        static let UserScope = "friends"
        static let vkVersion = "5.8"
        static let BaseURL = "https://api.vk.com/method/"
        static let MyProfile = "account.getProfileInfo"
        static let GetUser = "users.get"
        
        static let UserFields = "photo_id, verified, sex, bdate, city, country, home_town, has_photo, photo_200, online, lists, domain, has_mobile, contacts, site, education, universities, schools, status, last_seen, followers_count, common_count, occupation, nickname, relatives, relation, personal, connections, exports, wall_comments, activities, interests, music, movies, tv, books, games, about, quotes, can_post, can_see_all_posts, can_see_audio, can_write_private_message, can_send_friend_request, is_favorite, is_hidden_from_feed, timezone, screen_name, maiden_name, is_friend, friend_status, career, military, blacklisted, blacklisted_by_me"
    }

}
