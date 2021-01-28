//
//  TNGAccountItem.swift
//  Lighthouse
//
//  Created by Dmitry on 2021-01-27.
//  Copyright © 2021 Dmitry. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class TNGAccountItem: CustomViewFromXib {
    
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var accountBalanceLabel: UILabel!

    override func commonInit() {
        super.commonInit()
        self.backgroundColor = .clear
    }
    
}
