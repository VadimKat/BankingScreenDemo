//
//  PaymentsViewController.swift
//  BankingScreenDemo
//
//  Created by Vadim Katenin on 05.07.2020.
//  Copyright © 2020 Vadim Katenin. All rights reserved.
//

import UIKit

class PaymentsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var presenter: PaymentsViewPresenterProtocol!
    let paymentsCell = PaymentsCollectionViewCell()
    var model: [PaymentsModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: paymentsCell.paymentsCell, bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: paymentsCell.paymentsCell)
        
        presenter.populateLabels()
        setBackgroundImage()
        
    }
    
}

extension PaymentsViewController: PaymentsViewProtocol {
    func populate(with payments: [PaymentsModel]) {
        model = payments
    }
}

extension PaymentsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: paymentsCell.paymentsCell, for: indexPath) as! PaymentsCollectionViewCell
        cell.configure(result: model[indexPath.row])
        return cell
    }
}

extension PaymentsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.performBatchUpdates(nil, completion: nil)
    }
}

extension PaymentsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding = view.frame.width * 0.05
        let width  : CGFloat = collectionView.frame.width - 2 * padding
        var height : CGFloat = paymentsCell.originalCellHeight
        
        collectionView.contentInset.left = padding
        collectionView.contentInset.right = padding
        
        switch collectionView.indexPathsForSelectedItems?.first {
        case .some(indexPath):
            animateDropdownMenu(collectionView: collectionView, height: &height)
        default:
            height = paymentsCell.originalCellHeight
        }
        
        return CGSize(width: width, height: height)
    }
    
}

//MARK: Private helper methods
extension PaymentsViewController {
    
    private func setBackgroundImage() {
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "back")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    
    private func animateDropdownMenu(collectionView: UICollectionView, height: inout CGFloat) {
        let myIndexPath = collectionView.indexPathsForSelectedItems
        let cell = collectionView.cellForItem(at: myIndexPath!.first!) as! PaymentsCollectionViewCell
        
        if cell.frame.height == cell.originalCellHeight{
            height = 428
        } else {
            height = cell.originalCellHeight
        }
    }
}
