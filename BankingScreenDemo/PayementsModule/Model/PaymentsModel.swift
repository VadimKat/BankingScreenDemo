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
    var orderTotal: Int
    var payed: Int
    var completed: Int
    var payedByCustomer: Int
    var toBePayed: Int
    var payments: [Payment]
}

struct Payment {
    var paymentNumber: Int
    var paymentTotal: Int
    var paymentDate: Date
    var paymentCompletion: Bool
}
