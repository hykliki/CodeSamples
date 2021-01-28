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
    var accountSelection: TNGAccountPick!

    let account1: Account = Account(id: "123", number: "1919188273", nickname: "My Chequing Account", description: "Chequing Account", balance: 78920.84, type: AccountType.chequing, code: "CHQ", currency: CurrencyType.CAD)
    let account2: Account = Account(id: "124", number: "1919188281", nickname: "My Joint Account", description: "Joint Chequing Account", balance: 8876.73, type: AccountType.chequing, code: "CHQ", currency: CurrencyType.CAD)
    let account3: Account = Account(id: "126", number: "1919188289", nickname: "My Savigns Account", description: "Svings Account", balance: 672621.89, type: AccountType.chequing, code: "SAV", currency: CurrencyType.CAD)

    var accountList: [Account] = [] //todo ds: this should be observable
    var selectedAccount: Account? //todo ds: this should be observable



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

        accountSelection = TNGAccountPick()
        accountSelection.required = true

        buildAccountsArray()
        accountSelection.label = "To"
        accountSelection.placeHolder = "Select Account"
        accountSelection.accountList = accountList
        //accountSelection.selectedAccount

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
        buildAccountsArray()
    }



    //todo ds: debug remove this funciton
    func buildAccountsArray() {
        accountList.append(account1)
        accountList.append(account2)
        accountList.append(account3)
    }





}

