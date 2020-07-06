//
//  DateHelper.swift
//  BankingScreenDemo
//
//  Created by Vadim Katenin on 05.07.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import Foundation

func setDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "rus_RUS")
    dateFormatter.setLocalizedDateFormatFromTemplate("dd.MM.yy")
    return dateFormatter.string(from: date)
}
