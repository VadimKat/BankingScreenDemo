//
//  PaymentsCollectionViewCell.swift
//  BankingScreenDemo
//
//  Created by Vadim Katenin on 05.07.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import UIKit

class PaymentsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var orderNumber: UILabel!
    @IBOutlet weak var currentStateDate: UILabel!
    @IBOutlet weak var orderTotal: UILabel!
    @IBOutlet weak var payed: UILabel!
    @IBOutlet weak var completed: UILabel!
    @IBOutlet weak var payedByCustomer: UILabel!
    @IBOutlet weak var toBePayed: UILabel!
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    let paymentsCell = "PaymentsCell"
    var originalCellHeight: CGFloat = 164
    private let tableCell = "PaymentsTVCell"
    private var payments: [Payment] = []

    
    override func layoutSubviews() {
        super.layoutSubviews()
        // CollectionViewCell design
        layer.cornerRadius = 15
        layer.masksToBounds = true
        backgroundColor = .white
        
        // TableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        // Register TableView cell
        let cellNib = UINib(nibName: tableCell, bundle: nil)
         tableView.register(cellNib, forCellReuseIdentifier: tableCell)
        
        // Draw a line above TableView
        let point1 = CGPoint(x: 0, y: 98)
        let point2 = CGPoint(x: tableView.frame.width, y: 98)
        drawLineFromPoint(start: point1, toPoint: point2, ofColor: #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7843137255, alpha: 1), inView: self)
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
        cell.configureTable(result: payments[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 64
       }
}



