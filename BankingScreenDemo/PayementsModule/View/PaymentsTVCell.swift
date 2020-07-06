//
//  PaymentsTVCell.swift
//  BankingScreenDemo
//
//  Created by Vadim Katenin on 05.07.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import UIKit

class PaymentsTVCell: UITableViewCell {
    
    @IBOutlet weak var paymentNumber: UILabel!
    @IBOutlet weak var paymentTotal: UILabel!
    @IBOutlet weak var paymentDate: UILabel!
    @IBOutlet weak var statusButton: UIButton! {
        didSet {
            statusButton.layer.cornerRadius = 15
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configureTable(result: Payment) {
        paymentNumber.text = "Оплата №\(result.paymentNumber)"
        paymentTotal.text = "\(result.paymentTotal) р."
        paymentDate.text = setDate(date: result.paymentDate)
        
        if result.paymentCompletion == true {
            let greenColor = UIColor(red: 0.533, green: 0.965, blue: 0.106, alpha: 1)
            paymentTotal.textColor = greenColor
            paymentDate.textColor = greenColor
            statusButton.backgroundColor = greenColor
            statusButton.setTitle("Оплачено", for: .normal)
        } else {
            let grayColor = UIColor(red: 0.587, green: 0.587, blue: 0.587, alpha: 1)
            paymentTotal.textColor = grayColor
            paymentDate.textColor = grayColor
            statusButton.backgroundColor = grayColor
            statusButton.setTitle("Ожидание", for: .normal)
        }
    }
    
    
    
    
}
