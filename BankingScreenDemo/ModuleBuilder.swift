//
//  ModuleBuilder.swift
//  BankingScreenDemo
//
//  Created by Vadim Katenin on 05.07.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import UIKit

protocol Builder {
    static func createPaymentsVC() -> UIViewController
}

class ModelBuilder: Builder {
    static func createPaymentsVC() -> UIViewController {
        let date = NSDate.now
        let payment1 = Payment(paymentNumber: 1, paymentTotal: 200, paymentDate: date, paymentCompletion: true)
        let payment2 = Payment(paymentNumber: 2, paymentTotal: 300, paymentDate: date, paymentCompletion: true)
        let payment3 = Payment(paymentNumber: 3, paymentTotal: 500, paymentDate: date, paymentCompletion: false)
        let paymentsArray: [Payment] = [payment1, payment2, payment3]
        let model = PaymentsModel(orderNumber: 1, currentStateDate: date, orderTotal: 1000, payed: 200, completed: 500, payedByCustomer: 700, toBePayed: 300, payments: paymentsArray)
        var paymentsModelsArray: [PaymentsModel] = []
        paymentsModelsArray.append(model)
        let view = PaymentsViewController()
        let presenter = PaymentsPresenter(view: view, payments: paymentsModelsArray)
        view.presenter = presenter
        return view
    }
    
    
}
