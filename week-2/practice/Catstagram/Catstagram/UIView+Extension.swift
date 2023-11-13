//
//  UIView+Extension.swift
//  Catstagram
//
//  Created by Oh Chi Hyun on 2023/10/11.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
