//
//  AccountSelectionViewController.swift
//  Lighthouse
//
//  Created by Dmitry on 2021-01-27.
//  Copyright © 2021 Dmitry. All rights reserved.
//

import UIKit

class AccountSelectionViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {



    let account1: Account = Account(id: "123", number: "1919188273", nickname: "My Chequing Account", description: "Chequing Account", balance: 78920.84, type: AccountType.chequing, code: "CHQ", currency: CurrencyType.CAD)
    let account2: Account = Account(id: "124", number: "1919188281", nickname: "My Joint Account", description: "Joint Chequing Account", balance: 8876.73, type: AccountType.chequing, code: "CHQ", currency: CurrencyType.CAD)
    let account3: Account = Account(id: "126", number: "1919188289", nickname: "My Savigns Account", description: "Svings Account", balance: 672621.89, type: AccountType.chequing, code: "SAV", currency: CurrencyType.CAD)

    var items: [Account] = []

    func buildAccountsArray() {
        items.append(account1)
        items.append(account2)
        items.append(account3)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell"
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            tableView.register(UINib(nibName: "TNGAccountViewCell", bundle: nil), forCellReuseIdentifier: identifier)
            // tableView.register(TNGAccountViewCell.self, forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier)

         }

        let mc = cell as! TNGAccountViewCell


        if let decValue = items[indexPath.row].balance {
            let currencyFormatter = NumberFormatter()

            currencyFormatter.numberStyle = .currency

            let balance = currencyFormatter.string(from: NSDecimalNumber.init(decimal: decValue))
            mc.accountItem.accountBalanceLabel.text = balance
        }

        mc.accountItem.accountNameLabel.text = items[indexPath.row].nickname

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.parent?.dismiss(animated: true, completion: nil)
    }

    


    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var listTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        buildAccountsArray()
        headerLabel.text = "To Account"
        listTableView.delegate = self
        listTableView.dataSource = self

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
