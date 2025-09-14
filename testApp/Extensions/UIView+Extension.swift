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
    
    func cornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func applyCornerRadiusWithShadow(
            cornerRadius: CGFloat = 12,
            shadowColor: UIColor = .gray,
            shadowOpacity: Float = 0.3,
            shadowOffset: CGSize = CGSize(width: 0, height: 2),
            shadowRadius: CGFloat = 6
    ) {
        // Corner radius
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = false
        
        // Shadow
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
    }
}

extension UIImageView {
    func applyShadow(cornerRadius: CGFloat = 12) {
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false
    }
}

