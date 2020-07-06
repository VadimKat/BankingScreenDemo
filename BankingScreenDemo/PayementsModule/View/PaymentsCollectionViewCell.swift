//
//  PaymentsCollectionViewCell.swift
//  BankingScreenDemo
//
//  Created by Vadim Katenin on 05.07.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import UIKit

class PaymentsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var orderNumber: UILabel!
    @IBOutlet weak var currentStateDate: UILabel!
    @IBOutlet weak var orderTotal: UILabel!
    @IBOutlet weak var payed: UILabel!
    @IBOutlet weak var completed: UILabel!
    @IBOutlet weak var payedByCustomer: UILabel!
    @IBOutlet weak var toBePayed: UILabel!
//    @IBOutlet weak var a:UILabel!

    let paymentsCell = "PaymentsCell"
    var originalCellHeight: CGFloat = 164
    
    @IBOutlet weak var tableView: UITableView!
    
    let tableCell = "PaymentsTVCell"
    
    var payments: [Payment] = []

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 20
        layer.masksToBounds = true
        backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
//        tableView.addBorderTop(size: 0.6, color: #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7843137255, alpha: 1))
        

        let cellNib = UINib(nibName: tableCell, bundle: nil)
         tableView.register(cellNib, forCellReuseIdentifier: tableCell)
    }
    
    func configure(result: PaymentsModel) {
        orderNumber.text = "Заказ №\(result.orderNumber)"
        
        currentStateDate.text = "Состояние на \(setDate(date: result.currentStateDate))"
        orderTotal.text = "\(result.orderTotal) р."
        payed.text = "\(result.payed) р."
        completed.text = "\(result.completed) р."
        payedByCustomer.text = "\(result.payedByCustomer) р."
        toBePayed.text = "\(result.toBePayed) р."
        payments = result.payments
        
    }
}

extension PaymentsCollectionViewCell: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCell, for: indexPath) as! PaymentsTVCell
//        cell.textLabel?.text = "\(payments[indexPath.row].paymentNumber)"
        cell.configureTable(result: payments[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 64
       }
}



