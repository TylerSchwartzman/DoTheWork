//
//  UIView+Extensions.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 7/31/21.
//

import UIKit

extension UIView {
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
