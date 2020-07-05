//
//  PaymentsModel.swift
//  BankingScreenDemo
//
//  Created by Vadim Katenin on 05.07.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import Foundation

struct PaymentsModel {
    var orderNumber: Int
    var currentStateDate: Date
    var orderTotal: Double
    var payed: Double
    var completed: Double
    var payedByCustomer: Double
    var toBePayed: Double
    var payments: [Payment]
}

struct Payment {
    var paymentNumber: Int
    var paymentDate: Date
    var paymentCompletion: Bool
}
