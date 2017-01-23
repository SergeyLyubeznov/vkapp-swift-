//
//  FriendsViewController + TableView.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 17/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

extension FriendsViewController:UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = friends.count
        return count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "FriendsCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? BaseTableViewCell
        let user = itemAt(indexPath: indexPath)
        cell?.object = user
        
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let controller = Router.getController(controllerType:.profile) as! ProfileViewController
        let user = itemAt(indexPath: indexPath)
        controller.user = user
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    private func itemAt(indexPath:IndexPath) -> User {
        return friends[indexPath.row]
    }
}
