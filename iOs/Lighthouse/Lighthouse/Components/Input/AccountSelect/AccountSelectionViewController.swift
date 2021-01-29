//
//  AccountSelectionViewController.swift
//  Lighthouse
//
//  Created by Dmitry on 2021-01-27.
//  Copyright © 2021 Dmitry. All rights reserved.
//

import UIKit

class AccountSelectionViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {
    public var selectedAccount: Account?
    public var accountList: [Account] = []
    public var inputField: TNGAccountPick? // todo ds: make abstract // this is input field intiating // can there be a better name?

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var listTableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell"
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            tableView.register(UINib(nibName: "TNGAccountViewCell", bundle: nil), forCellReuseIdentifier: identifier)
            // tableView.register(TNGAccountViewCell.self, forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier)

         }

        if let mc = cell as? TNGAccountViewCell {
            if let decValue = accountList[indexPath.row].balance {
                let currencyFormatter = NumberFormatter()

                currencyFormatter.numberStyle = .currency

                let balance = currencyFormatter.string(from: NSDecimalNumber.init(decimal: decValue))
                mc.accountItem.accountBalanceLabel.text = balance
            }

            if selectedAccount?.id == accountList[indexPath.row].id {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            mc.accountItem.accountNameLabel.text = accountList[indexPath.row].nickname ?? accountList[indexPath.row].description
        }
        cell.tintColor = UIColor.red // todo ds: set proper color!

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let index: Int? = accountList.firstIndex(where: { self.selectedAccount?.id == $0.id })

        if let row = index {

            let oldIndexPath: IndexPath = IndexPath(row: row, section: 0)
            self.listTableView.deselectRow(at: oldIndexPath, animated: true)
            self.listTableView.cellForRow(at: oldIndexPath)?.accessoryType = .none
        }

        let selectedCell: UITableViewCell = listTableView.cellForRow(at: indexPath)!
        selectedCell.accessoryType = .checkmark

        selectedAccount = accountList[indexPath.row]
        if let parentInput = self.inputField {
            parentInput.selectedAccount = selectedAccount
        }
        self.parent?.dismiss(animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        headerLabel.text = "To Account" // todo ds: proper text
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
