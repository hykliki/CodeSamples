//
//  FontMetrics.swift
//  Lighthouse
//
//  Created by Dmitry on 2021-01-24.
//  Copyright © 2021 Dmitry. All rights reserved.
//

import Foundation
import UIKit

// metrics wrapper allowing IOS 11 Devices to take advantage off phone metrics scaling while earlier our ios versions fall back on the scale calculation
struct FontMetrics {
    
    // scale value based on the current device sticks size setting. With the device using the default large setting's Keller will be one. Only use when you font metrics is not available
    static var scaler: CGFloat {
        return UIFont.preferredFont(forTextStyle: .body).pointSize / 17.0
    }
    
    // returns a version of specified phone that adults the car and font metrics
    static func scaledFont(for font: UIFont) -> UIFont {
        if #available(iOS 11.0, *) {
            return UIFontMetrics.default.scaledFont(for: font)
        } else {
            return font.withSize(scaler * font.pointSize)
        }
    }
    
    // returns a version of the specified phone that adopts the current font metrics and fees constrained to the specific maximum size
    static func scaledFont(for font: UIFont, maximumPointSize: CGFloat) -> UIFont {
        if #available(iOS 11.0, *) {
            return UIFontMetrics.default.scaledFont(for: font, maximumPointSize: maximumPointSize, compatibleWith: nil)
        } else {
            return font.withSize(min(scaler * font.pointSize, maximumPointSize))
        }
    }
    
    // scales and arbitrary layouts value based on the current dynamic type settings
    static func scaledValue(for value: CGFloat) -> CGFloat {
        if #available(iOS 11.0, *) {
            return UIFontMetrics.default.scaledValue(for: value)
        } else {
            return scaler * value
        }
    
    }
    
}
