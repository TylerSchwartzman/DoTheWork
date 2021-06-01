//
//  TaskItemCell.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 5/26/21.
//

import UIKit

class TaskItemCell: UITableViewCell {

    static let identifier: String = String(describing: self)

    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var notificationLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
