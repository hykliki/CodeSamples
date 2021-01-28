//
//  Account.swift
//  Lighthouse
//
//  Created by Dmitry on 2021-01-26.
//  Copyright © 2021 Dmitry. All rights reserved.
//

import Foundation

enum CurrencyType: String, Codable {
    case CAD
    case USD
}

enum AccountType: String, Codable {
    case chequing = "CHEQUING"
    case savings = "SAVINGS"
    case mutualFund = "MUTUAL_FUND"
    case mortgate = "MORTGAGE"
    case loan = "LOAN"
    case other = "OTHER"
    case creditCard = "CREDIT_CARD"
    case external = "EXT"
}

struct Account: Codable {
    let id: String
    let number: String
    let nickname: String?
    let description: String
    let balance: Decimal?
    let type: AccountType
    let code: String
    let currency: CurrencyType?

    enum CodingKeys: String, CodingKey {
        case id = "number"
        case number = "display_name"
        case nickname = "nickname"
        case description = "description"
        case balance = "account_balance"
        case type = "type"
        case code = "product_code"
        case currency = "currency_type"
    }

}
