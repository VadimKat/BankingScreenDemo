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

    override func layoutSubviews() {
        layer.cornerRadius = 20
        layer.masksToBounds = true
        backgroundColor = .white

    }
    
    func configure(result: PaymentsModel) {
        orderNumber.text = "Заказ №\(result.orderNumber)"
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "rus_RUS")
        dateFormatter.setLocalizedDateFormatFromTemplate("dd.MM.yy")
        currentStateDate.text = "Состояние на \(dateFormatter.string(from: result.currentStateDate))"
        
        orderTotal.text = "\(result.orderTotal) р."
        payed.text = "\(result.payed) р."
        completed.text = "\(result.completed) р."
        payedByCustomer.text = "\(result.payedByCustomer) р."
        toBePayed.text = "\(result.toBePayed) р."
        
    }

//    override init(frame: CGRect) {
//           super.init(frame: frame)
//        setupViews()
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

//    let purpleView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = #colorLiteral(red: 0.5294117647, green: 0.3921568627, blue: 0.8549019608, alpha: 1)
//        view.frame = CGRect.zero
//        return view
//    }()

//    var purpleViewBotomConst = NSLayoutConstraint()
//       var purpleViewHight = NSLayoutConstraint()
//       var pupleViewLeading = NSLayoutConstraint()
//       var pupleViewTrailing = NSLayoutConstraint()
//
//    func setupViews () {
//    addSubview(purpleView)
//       purpleViewBotomConst = purpleView.bottomAnchor.constraint(equalTo: bottomAnchor)
//        pupleViewLeading = purpleView.leadingAnchor.constraint(equalTo:leadingAnchor)
//        pupleViewTrailing = purpleView.trailingAnchor.constraint(equalTo: trailingAnchor)
//        purpleViewHight = purpleView.heightAnchor.constraint(equalToConstant: 66)
//        let constraints = [
//            purpleViewBotomConst, pupleViewLeading, purpleViewHight, pupleViewTrailing]
//        NSLayoutConstraint.activate(constraints)
//
//    }



}
