//
//  TNGTextInput.swift
//  Lighthouse
//
//  Created by Dmitry on 2021-01-24.
//  Copyright © 2021 Dmitry. All rights reserved.
//

import Foundation
import UIKit

import RxSwift
import RxCocoa


class TNGTextInput: CustomViewFromXib, UITextFieldDelegate {

    var errorRequiredMsg = "global.validation.required"

    var validators: [Validator] = []

    let disposeBag = DisposeBag()

    var value: BehaviorRelay<String> = .init(value: String())

    @IBOutlet weak var fieldNameLabel: UILabel!
    @IBOutlet var errorPlaceholder: UIView!
    @IBOutlet weak var textFieldInput: UITextField!
    @IBOutlet var divider: UIView!
    @IBOutlet weak var errorPlaceholderHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var errorMessage: UILabel!

    var activeBorderColor: UIColor = UIColor.lightGray //todo poroper colors!
    var inactveBorderColor: UIColor = UIColor.lightGray
    var errorBorderColor: UIColor = UIColor.red

    var touched: Bool = false

    // Save error placeholder height from XiB when it's loaded
    // when error message is hidden it's height constraint is set
    // to 0 when it needs to be displayed it will be set to the value
    // saved in this variable.
    var errorPlaceholderHeight: CGFloat = 0

    @IBInspectable
    var required: Bool = false

    var externalError: String?
    var internalErrors = [String]()

    var isEnabled: Bool {
        get {
            return self.textFieldInput.isEnabled
        }
        set {
            self.textFieldInput.isEnabled = newValue
        }
    }

    @IBInspectable
    var placeHolder: String = "" {
        willSet {
            self.textFieldInput.placeholder = newValue
        }
    }

    @IBInspectable
    var label: String = "" {
        willSet {
            self.fieldNameLabel.text = newValue.localized
        }
    }

    @IBInspectable
    // Regular accessor for text value of embedded UITextField
    // For Observable = use "value" property
    var text: String? {
        set {
            self.textFieldInput.text = newValue
        }
        get {
            return self.textFieldInput.text
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUi()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUi()
    }

    private func configureUi() {
        self.backgroundColor = .clear
        errorPlaceholderHeight = self.errorPlaceholderHeightConstraint.constant
        hideErrorPlaceholder() //Initially hide error
        textFieldInput.delegate = self
        textFieldInput.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        textFieldInput.font = .textfield
        errorMessage.font = .subLabel
        fieldNameLabel.font = .subLabel
        self.updateCustomBorderColor()
        setupRx()
    }

    internal func setupRx() {
        self.textFieldInput
            .rx
            .text
            .orEmpty
            //.debug(value.value, trimOutput: true)
            .bind(to: value)
            .disposed(by: disposeBag)

        self.textFieldInput.rx.controlEvent([.editingDidBegin])
            .asObservable()
            .subscribe(onNext: {
                self.didBeginEditing()
            })
            .disposed(by: disposeBag)

        self.textFieldInput.rx.controlEvent([.editingDidEnd])
            .asObservable()
            .subscribe(onNext: {
                self.didEndEditing()
            })
            .disposed(by: disposeBag)
    }

    internal func didBeginEditing() {
        self.updateCustomBorderColor()
    }

    internal func didEndEditing() {
        self.touched = true
        self.updateCustomBorderColor()
        self.validate()
    }

    private func hideErrorPlaceholder() {
        UIView.animate(withDuration: 0.1) {
            self.errorPlaceholderHeightConstraint.constant = 0
            self.layoutIfNeeded()
        }
        self.errorPlaceholder.isHidden = true
    }

    private func showErrorPlaceholder() {
        UIView.animate(withDuration: 0.1) {
            self.errorPlaceholderHeightConstraint.constant = self.errorPlaceholderHeight
            self.layoutIfNeeded()
        }
        self.errorPlaceholder.isHidden = false
    }

    private func setError(errorText: String) {
        self.errorMessage.text = errorText
        self.updateCustomBorderColor()
        showErrorPlaceholder()
    }

    func setExternalError(errorText: String) {
        // todo ds: add this ability
    }

    private func updateCustomBorderColor() {
        if !self.errorPlaceholder.isHidden {
            self.divider.backgroundColor = errorBorderColor
        } else {
            if self.textFieldInput.isEditing {
                self.divider.backgroundColor = activeBorderColor
            } else {
                self.divider.backgroundColor = inactveBorderColor
            }
        }
    }

    private func clearErrors() {
        self.errorMessage.text = nil
        self.hideErrorPlaceholder()
        self.updateCustomBorderColor()
    }

    func isValid() -> Bool {
        return self.internalErrors.isEmpty
    }

    func addValidator(_ validator: Validator) {
        validators.append(validator)
    }

    func resetValidationCheck() {
        self.clearErrors()
    }

    @discardableResult func validateInput(shouldIgnoreEmptyText: Bool = false) -> Bool {
        if let text = self.text {
            if text.isEmpty && shouldIgnoreEmptyText {
                return true
            }


            if !isEnabled {
                return true
            }

            for validator in self.validators {
                if !validator.validateText(input: text) {
                    if let msg = validator.errorMessage {
                        self.internalErrors.append(msg)
                    }
                }
            }
        }
        return true
    }

    internal func applyValidations() {
        if self.required && (self.textFieldInput.text ?? "").isEmpty {
            internalErrors.append(errorRequiredMsg.localized)
        }
    }

    private func validate() {
        self.internalErrors = [] // reset errors
        self.applyValidations()
        if !internalErrors.isEmpty {
            self.setError(errorText: internalErrors[0])
        } else {
            clearErrors()
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }

    // todo: add comment here and other public funcs
    func markAsTouched() {
        touched = true
        validate()
    }

    @objc func textFieldDidChange() {
        if touched {
            validate()
        }
    }
}

