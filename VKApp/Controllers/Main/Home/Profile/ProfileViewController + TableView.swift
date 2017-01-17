//
//  ProfileViewController + TableView.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 14/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import Foundation
import UIKit

internal let ProfileCellIdentifiers = ["ProfileUserInfoCell","ProfleCounterCell"]

enum ProfileCellIdentifier:Int {
    case userInfo = 0, counter = 1
    var name:String {
        return genderNames[self.rawValue]
    }
}

extension ProfileViewController:UITableViewDelegate, UITableViewDataSource {
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
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
        
        return sections;
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
                counterCell.object = counterItemsAt(indexPath: indexPath)
                counterCell.pressedCounter = {(title) in
                    print(title)
                    self.showController(for: title)
                }
            default: break
                //
            }
        }
        return cell!
    }
    
    private func showController(for title:String) {
        let controller = Router.getController(forTitle: title)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func counterItemsAt(indexPath:IndexPath) -> [CounterItem] {
        
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
