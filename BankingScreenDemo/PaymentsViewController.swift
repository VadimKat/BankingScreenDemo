//
//  PaymentsViewController.swift
//  BankingScreenDemo
//
//  Created by Vadim Katenin on 05.07.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import UIKit

class PaymentsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: PaymentsViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.populateLabels()
    }
}

extension PaymentsViewController: PaymentsViewProtocol {
    func populate(orderNumber: Int) {
//        self.numberLabel.text = "\(orderNumber)"
    }
}

extension PaymentsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}
extension PaymentsViewController: UICollectionViewDelegate {
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           collectionView.performBatchUpdates(nil, completion: nil)
       }
}
extension PaymentsViewController: UICollectionViewDelegateFlowLayout {
    
}
