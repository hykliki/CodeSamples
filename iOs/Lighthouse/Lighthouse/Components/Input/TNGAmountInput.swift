//
//  MCSAmountInput.swift
//  Lighthouse
//
//  Created by Dmitry on 2021-01-24.
//  Copyright © 2021 Dmitry. All rights reserved.
//

import Foundation
import UIKit

import RxSwift
import RxCocoa

@IBDesignable
class TNGAmountInput: TNGTextInput {
    
    var errorAmountMin = "rdc.error.amount.min"
    var errorAmountMax = "rdc.error.amount.max"
    
    var amount: BehaviorSubject<Decimal?> = .init(value: nil)
    
    let AMOUNT_PATTERN = "^\\d*((\\.|,)\\d{0,2})?$"
    let MAX_AMOUNT: Decimal = NSNumber(999999999.99).decimalValue
    
    var minAmount: Decimal = NSNumber(0.01).decimalValue
    var maxAmount: Decimal = NSNumber(999999999.99).decimalValue
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initUI()
    }
    
    private func initUI() {
        self.textFieldInput.keyboardType = .decimalPad
        self.textFieldInput.placeholder = self.formatAmountValue(amount: 0, forEdit: false)
    }
    
    override func setupRx() {
        super.setupRx()
        self.value
        .subscribe(onNext: {
            print(#line, $0) //todo ds: remove print
            self.amount.onNext(self.amountValue()?.decimalValue)
        })
        .disposed(by: disposeBag)
    }
    
    private func formatAmount(forEdit: Bool) -> String? {
        if let val = self.amountValue() {
            return formatAmountValue(amount: val, forEdit: forEdit)
        }
        return nil
    }

    private func amountValue() -> NSNumber? {
        if let amountText = self.text {
            return self.parseAmountFromText(amountText: amountText)
        }
        return nil
    }
    
    private func formatAmountValue(amount: NSNumber, forEdit: Bool) -> String? {
        // todo ds: see if UIUtils can be used for currency formatting
        
        let currencyFormatter = NumberFormatter()
        
        currencyFormatter.numberStyle = .currency
        
        if forEdit {
            currencyFormatter.usesGroupingSeparator = false
            currencyFormatter.currencySymbol = ""
        }
        
        if let formattedValue = currencyFormatter.string(from: amount) {
            return formattedValue.trimmingCharacters(in: .whitespaces)
        }
        return nil
    }
    
    private func stringToDecimal(decimalString: String, defaultValue: Decimal) -> Decimal {
        if let result = Decimal(string: decimalString) {
            return result
        }
        return defaultValue
    }
    
    private func parseAmountFromText(amountText: String) -> NSNumber? {
        let currencyFormatter = NumberFormatter()
        
        if let amount = Decimal(string: self.stripCurrencyFormattingSymbols(amountText: amountText, nf: currencyFormatter)) {
            return NSDecimalNumber.init(decimal: amount)
        }
        
        // It will probably never reach this code since formatting symbols are stripped
        // above before converting to decimal so it should always convert successfully
        currencyFormatter.numberStyle = .currency
        if let formattedValue = currencyFormatter.number(from: amountText) {
            return formattedValue
        }
        return nil
    }
    
    private func stripCurrencyFormattingSymbols(amountText: String, nf: NumberFormatter) -> String {
        let textValue = amountText.replacingOccurrences(of: nf.groupingSeparator, with: "")
            .replacingOccurrences(of: nf.currencySymbol, with: "")
            .replacingOccurrences(of: nf.decimalSeparator, with: ".")
            .trimmingCharacters(in: .whitespaces)
        return textValue
    }

    override func didBeginEditing() {
        super.didBeginEditing()
        self.text = self.formatAmount(forEdit: true)
    }

    override func didEndEditing() {
        super.didEndEditing()
        self.text = self.formatAmount(forEdit: false)
    }

    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text ?? "") as NSString
        let newText = text.replacingCharacters(in: range, with: string)
        var regexMatches = false
        if let regex = try? NSRegularExpression(pattern: AMOUNT_PATTERN, options: .caseInsensitive) {
            regexMatches = regex.numberOfMatches(in: newText, options: .reportCompletion, range: NSRange(location: 0, length: (newText as NSString).length)) > 0
        }

        if regexMatches {
            if let amount = self.parseAmountFromText(amountText: newText) {
                return amount.decimalValue <= self.MAX_AMOUNT
            }
            return true // self.value is nil - allow to continue editing
        }
        return false
    }


    override func applyValidations() {
        super.applyValidations()

        if let amt = self.amountValue() {
            if amt.decimalValue < minAmount {
                self.internalErrors.append(errorAmountMin.localized)
            } else if amt.decimalValue > maxAmount {
                self.internalErrors.append(errorAmountMax.localized)
            }
        }
    }

    override func getNibName() -> String {
        return "TNGTextInput"
    }

}
