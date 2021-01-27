//
//  Validator.swift
//  Lighthouse
//
//  Created by Dmitry on 2021-01-24.
//  Copyright © 2021 Dmitry. All rights reserved.
//

import Foundation

protocol Validator {
    var errorMessage: String? { get }
    func validateText(input: String ) -> Bool
}
