//
//  ViewController.swift
//  Lighthouse
//
//  Created by Dmitry on 2021-01-24.
//  Copyright © 2021 Dmitry. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {

    var chequeAmount: TNGAmountInput!
    var accountSelection: TNGSelect!


    @IBOutlet weak var amountInputContainer: UIView!
    @IBOutlet weak var accountSelectContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        chequeAmount = TNGAmountInput()
        chequeAmount.required = true

        self.amountInputContainer.addSubview(chequeAmount)
        //self.amountInputContainer.backgroundColor = .clear

        chequeAmount.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        accountSelection = TNGSelect()
        accountSelection.required = true

        accountSelection.label = "To"
        accountSelection.placeHolder = "Select Account"

        self.accountSelectContainer.addSubview(accountSelection)
        self.accountSelectContainer.backgroundColor = .clear

        accountSelection.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }




        self.setupHideKeyboardOnTap()

    }

    func setupHideKeyboardOnTap() {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }

    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }

    @IBAction func buttonAction(_ sender: Any) {
//        presentSelection()
    }



}

