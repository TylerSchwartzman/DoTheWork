//
//  UILabel+Extensions.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 4/13/21.
//

import UIKit

extension UILabel {
    static func makeDynamicLabel(for textStyle: UIFont.TextStyle) -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: textStyle)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }
}
