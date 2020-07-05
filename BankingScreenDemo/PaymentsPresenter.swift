//
//  PaymentsPresenter.swift
//  BankingScreenDemo
//
//  Created by Vadim Katenin on 05.07.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import Foundation

protocol PaymentsViewProtocol: class {
    func populate(orderNumber: Int)
}

protocol PaymentsViewPresenterProtocol: class {
    init (view: PaymentsViewProtocol, payments: PaymentsModel)
    func populateLabels()
}

class PaymentsPresenter: PaymentsViewPresenterProtocol {
    
    weak var view: PaymentsViewProtocol?
    let payments: PaymentsModel
    
    required init(view: PaymentsViewProtocol, payments: PaymentsModel) {
        self.view = view
        self.payments = payments
    }
    func populateLabels() {
        let number = self.payments.orderNumber
        self.view?.populate(orderNumber: number)
    }
}
