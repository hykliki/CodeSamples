//
//  UIFont.swift
//  Lighthouse
//
//  Created by Dmitry on 2021-01-24.
//  Copyright © 2021 Dmitry. All rights reserved.
//

import Foundation

import UIKit

extension UIFont {
    static let textfield = {
        return UIFont.regular.withSize(16)
    }()
    
    static let subLabel = {
        return UIFont.regular.withSize(14)
    }()
    
    static let regular = {
        return UIFont(name: "Circular-Book", size: UIFont.labelFontSize)?.scaled()
        ?? .systemFont(ofSize: UIFont.labelFontSize)
    }()
    
    func scaled() -> UIFont {
        return FontMetrics.scaledFont(for: self)
    }
}
