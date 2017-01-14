//
//  ProfileViewController + TableView.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 14/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import Foundation
import  UIKit

extension ProfileViewController:UITableViewDelegate, UITableViewDataSource {
    
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ProfileUserInfoCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? BaseTableViewCell
        
        if let profile = self.profile {
            cell?.object = profile
        }
        
        return cell!
    }
    
}
