//
//  ProfleCounterCell.swift
//  VKApp
//
//  Created by Sergey Lyubeznov on 17/01/2017.
//  Copyright © 2017 Sergey Lyubeznov. All rights reserved.
//

import UIKit

class ProfleCounterCell: BaseTableViewCell {
    
    @IBOutlet weak var counterViewFirst:CounterView!
    @IBOutlet weak var counterViewSecond:CounterView!
    
    var pressedCounter: ((_ string:String) -> (Void))?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addClosureAt(counterView: counterViewFirst)
        addClosureAt(counterView: counterViewSecond)
        
    }
    
    private func addClosureAt(counterView:CounterView) {
        counterView.pressedCounter = {(title) in
            if self.pressedCounter != nil {
                self.pressedCounter!(title)
            }
        }
    }

    override func updateUI() {
        
        guard let items = object as? [CounterItem] else {
            return
        }
        
        if items.count > 1 {
            counterViewFirst.viewModel(model: items.first!)
            counterViewSecond.viewModel(model: items.last!)
            counterViewFirst.isHidden = false
            counterViewSecond.isHidden = false
        } else {
            counterViewFirst.viewModel(model: items.first!)
            counterViewSecond.isHidden = true
        }
        
    }

}
