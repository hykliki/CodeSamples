//
//  CustomViewFromXib.swift
//  Lighthouse
//
//  Created by Dmitry on 2021-01-24.
//  Copyright © 2021 Dmitry. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CustomViewFromXib: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    internal func getNibName() -> String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".")[1]
    }
    
    func commonInit() {
        let bundle = Bundle.init(for: Self.self)
        let nibName = getNibName()
        if let viewsToAdd = bundle.loadNibNamed(nibName, owner: self, options: nil),
            let contentView = viewsToAdd.first as? UIView {
            addSubview(contentView)
            contentView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }
}
