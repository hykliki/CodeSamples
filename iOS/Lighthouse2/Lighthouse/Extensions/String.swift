//
//  String.swift
//  Lighthouse
//
//  Created by Dmitry on 2021-01-24.
//  Copyright © 2021 Dmitry. All rights reserved.
//

import Foundation


extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "\(self)_comment")
    }
}
