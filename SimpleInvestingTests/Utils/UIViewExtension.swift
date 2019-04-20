//
//  UIViewExtension.swift
//  SimpleInvestingTests
//
//  Created by Antonio Rodrigues on 20/04/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

extension UIView {
    func outlineRecursively(color: UIColor, width: CGFloat = 1) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        
        for view in subviews {
            view.outlineRecursively(color: color, width: width)
        }
    }
}
