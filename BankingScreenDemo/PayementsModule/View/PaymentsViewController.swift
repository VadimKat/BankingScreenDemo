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
    let paymentsCell = PaymentsCollectionViewCell()
    var model: [PaymentsModel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: paymentsCell.paymentsCell, bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: paymentsCell.paymentsCell)
//        collectionView.register(PaymentsCollectionViewCell.self, forCellWithReuseIdentifier: customCell.cellID)

        self.presenter.populateLabels()
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
                animateDropMenu(collectionView: collectionView, height: &height)
            default:
                height = paymentsCell.originalCellHeight
            }
            
            return CGSize(width: width, height: height)
        }
        
        //MARK: Private helper functions
        fileprivate func animateDropMenu(collectionView: UICollectionView, height: inout CGFloat) {
            let myIndexPath = collectionView.indexPathsForSelectedItems
            let cell = collectionView.cellForItem(at: myIndexPath!.first!) as! PaymentsCollectionViewCell
        
            if cell.frame.height == cell.originalCellHeight{
    //            let titleOGHeight = cell.title.frame.height
    //            let constraints = [cell.titleTop, cell.titleBottom, cell.buttonsStackHeight]
    //            let buttonHeight = cell.originalCellHeight / 2
    //            let stackSpacing : CGFloat = 25
    //            let constraints = [cell.containerViewHight]
    //            NSLayoutConstraint.deactivate(constraints)
                
               
    //            cell.buttonsStackView.isHidden = false
    //            cell.buttonsStackView.spacing = stackSpacing
    //            cell.titleTop = cell.title.topAnchor.constraint(equalTo: cell.topAnchor)
    //            cell.titleHeight = cell.title.heightAnchor.constraint(equalToConstant: titleOGHeight)
    //            cell.buttonsStackHeight = cell.deleteButton.heightAnchor.constraint(equalToConstant: buttonHeight)
    //            cell.containerViewHight = cell.containerView.heightAnchor.constraint(equalToConstant: 263)
    //            let newConstraints = [cell.titleTop, cell.titleHeight, cell.buttonsStackHeight]
    //            let newConstraints = [cell.containerViewHight]
    //            NSLayoutConstraint.activate(newConstraints)
    //            height = cell.originalCellHeight + buttonHeight * 2 + stackSpacing * 2
//                cell.containerView.isHidden = false
                height = 428

            } else {
                height = cell.originalCellHeight
//                cell.containerView.isHidden = true
            }
        }
}
