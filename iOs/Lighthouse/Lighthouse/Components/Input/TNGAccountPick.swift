//
//  TNGSelect.swift
//  Lighthouse
//
//  Created by Dmitry on 2021-01-26.
//  Copyright © 2021 Dmitry. All rights reserved.
//

import Foundation
import UIKit

import RxCocoa
import RxSwift

import MaterialComponents.MaterialBottomSheet
import MaterialComponents.MaterialShapeScheme

class TNGAccountPick: TNGTextInput {

    var accountList: [Account] = [] //todo ds: this should be observable
    var _selectedAccount: Account?
    var accountSubject: BehaviorSubject<Account?> = .init(value: nil)
    var selectedAccount: Account? {
        //todo ds: this should be observable
        set {
            self._selectedAccount = newValue
            self.textFieldInput.text = newValue?.nickname ?? newValue?.description
            self.accountSubject.onNext(newValue)
        }
        get {
            return _selectedAccount
        }
    }

    override func setupRx() {

        super.setupRx()
        self.textFieldInput.isUserInteractionEnabled = false
        let tapGesture = UITapGestureRecognizer()
        addGestureRecognizer(tapGesture)

        tapGesture.rx.event.bind(onNext: { recognizer in
            self.presentSelection()
            // todo ds: these 2 lines - attempt to deal with problem when amount input field is selected then bottom sheet is activated
            // when bottom sheet is then dismissed focus returns back to amount input field and keyboard pops up - we don't want it to
            // happen. 1st line atlest triggers end editin, and formattting for display takes palce, but focus still returns back
            // to amount field
            self.parentViewController?.view.endEditing(true)
            self.parentViewController?.view.resignFirstResponder()

            // print("touches: \(recognizer.numberOfTouches)") todo ds: this is not needed remove
        }).disposed(by: disposeBag)
    }

    override func getNibName() -> String {
        return "TNGTextInput"
    }

    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }

    func presentSelection() {
        let viewController: AccountSelectionViewController = AccountSelectionViewController()
        viewController.accountList = accountList
        viewController.selectedAccount = selectedAccount
        viewController.inputField = self
        //viewController.view.roundCorners([.topLeft, .topRight], radius: 15)

        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: viewController)
        let shapeGenerator = roundCorners()
        bottomSheet.setShapeGenerator(shapeGenerator, for: .preferred)
        bottomSheet.setShapeGenerator(shapeGenerator, for: .extended)
        bottomSheet.setShapeGenerator(shapeGenerator, for: .closed)
        if let pvc = parentViewController {
            pvc.present(bottomSheet, animated: true, completion: nil)
        }
    }

    func roundCorners() -> MDCShapeGenerating {
        let shapeGenerator = MDCRectangleShapeGenerator()
        let cornerTreatment = MDCRoundedCornerTreatment(radius: 15)
        shapeGenerator.topLeftCorner = cornerTreatment
        shapeGenerator.topRightCorner = cornerTreatment
        return shapeGenerator
    }

}
