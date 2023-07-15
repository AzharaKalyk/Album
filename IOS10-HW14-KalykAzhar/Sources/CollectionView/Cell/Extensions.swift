//
//  Extensions.swift
//  IOS10-HW14-KalykAzhar
//
//  Created by Azhar Kalyk on 12.07.2023.
//

import UIKit

extension UIView {
    
    func addSubviewsForAutoLayout(_ views: [UIView]) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
}

