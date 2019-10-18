//
//  UITableView+loadWithAnimation.swift
//  primir
//
//  Created by Anika Morris on 10/17/19.
//  Copyright © 2019 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

// Thank you to Alfi (https://stackoverflow.com/users/6449292/alfi) from Stack Overflow for this amazing extension!
// https://stackoverflow.com/questions/33410482/table-view-cell-load-animation-one-after-another
extension UITableView {
    func reloadWithAnimation() {
        self.reloadData()
        //let tableViewHeight = self.bounds.size.height
        let tableViewWidth = self.bounds.size.width
        let cells = self.visibleCells
        var delayCounter = 0
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: tableViewWidth, y: 0)
        }
        for cell in cells {
            UIView.animate(withDuration: 1.0, delay: 0.1 * Double(delayCounter),usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
}
