//
//  HeaderView.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 4/13/21.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {
    static let identifier: String = String(describing: self)
        
    @IBOutlet weak var label: UILabel!

    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
