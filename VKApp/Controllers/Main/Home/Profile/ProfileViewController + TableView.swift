//
//  ProfileViewController + TableView.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 14/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import Foundation
import UIKit

internal let ProfileCellIdentifiers = ["ProfileUserInfoCell","ProfleCounterCell","ProfilePhotosCell"]

internal let ProfileSectionNames = ["","Статистика","Фотографии"]

enum ProfileCellIdentifier:Int {
    case userInfo = 0, counter = 1
    var name:String {
        return genderNames[self.rawValue]
    }
}

extension ProfileViewController:UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rows = 1
        
        if section == 1 {
            
            if let items = user?.counters?.items {
                let count:Double = Double(items.count)
                let countersCount  = round(count / 2.0)
                
                rows =  Int(countersCount)
            }
        }
        
        return rows;
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        var sections = 1
        
        if let items = user?.counters?.items {
            
            if items.count > 0 {
                sections += 1
            }
        }
        
        if user != nil {
            
            if (user?.hasPhotos)! {
                sections += 1
            }
        }
        
        return sections;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ProfileSectionNames[section]
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = ProfileCellIdentifiers[indexPath.section]
        let cell:BaseTableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? BaseTableViewCell
        
        if let user = self.user {
            
            switch indexPath.section {
            case 0:cell?.object = user
            case 1:
                guard let counterCell = cell as? ProfleCounterCell else {
                    break
                }
                counterCell.object = counterItemAt(indexPath: indexPath)
                weak var this = self
                counterCell.pressedCounter = {(title) in
                    guard let vcType = ControllerType(rawValue: title) else {
                        return
                    }
                    this?.showController(controllerType: vcType)
                }
            case 2:
                guard let photosCell = cell as? ProfilePhotosCell else {
                    break
                }
                photosCell.object = user
                weak var this = self
                photosCell.pressedPhoto = {(photo) in
                guard let vcType = ControllerType(rawValue: "Photos") else {
                      return
                    }
                    this?.showController(controllerType: vcType)
                }


            default: break
                //
            }
        }
        return cell!
    }
    
    private func showController(controllerType:ControllerType) {
        
        var controller:BaseViewController = BaseViewController()
        
        switch controllerType {
        case .friends,.mutualFriends,.onlineFriends:
            controller = Router.getController(controllerType: .friends)
            let friendsController = controller as! FriendsViewController
            friendsController.userID = (user?.id.description)!
            friendsController.isMyFriends = isMyProfile
            
            if controllerType == .onlineFriends {
                friendsController.friendsType = .online
            } else if controllerType == .mutualFriends {
                friendsController.friendsType = .mutual
            }

            controller = friendsController
            
        case .photos:
            controller = Router.getController(controllerType: .photos)
            let photosController = controller as! PhotosViewController
            photosController.photos = (user?.photos)!
            controller = photosController
        default:
            break
        }
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func counterItemAt(indexPath:IndexPath) -> [CounterItem] {
        
        var resultItems:[CounterItem] = []
        
        var index = indexPath.row * 2
        if let items = user?.counters?.items {
            
            for i in 0...1 {
                index+=i
                if index < items.count {
                    let item = items[index]
                    resultItems.append(item)
                }
            }
        }
        return resultItems
    }
}
