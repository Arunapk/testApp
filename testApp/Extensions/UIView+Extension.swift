//
//  UIView+Extension.swift
//  testApp
//
//  Created by HTS-676 on 13/09/25.
//

import Foundation
import UIKit

extension UIView {
    func applyTopCornerRadius(_ radius: CGFloat,
                              borderColor: UIColor = .clear,
                              borderWidth: CGFloat = 0,
                              shadowColor: UIColor = .black,
                              shadowOpacity: Float = 0.2,
                              shadowOffset: CGSize = CGSize(width: 0, height: -3),
                              shadowRadius: CGFloat = 6) {
        
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
        
        // Border
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        
        // Shadow
        layer.masksToBounds = false
        layer.shadowPath = path.cgPath
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
    }
}
