//
//  TextField.swift
//  QuizChallenge
//
//  Created by André Alves on 08/03/20.
//  Copyright © 2020 André Alves. All rights reserved.
//

import UIKit

@IBDesignable

class TextField: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.clipsToBounds = true
        }
    }
    @IBInspectable var verticalPadding: CGFloat = 0.0
    @IBInspectable var horizontalPadding: CGFloat = 0.0
    
    private func getPadding() -> UIEdgeInsets {
        return UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
    }

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: getPadding())
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: getPadding())
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: getPadding())
    }
}
