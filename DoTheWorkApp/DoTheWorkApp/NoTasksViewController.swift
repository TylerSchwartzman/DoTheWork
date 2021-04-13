//
//  NoTasksViewController.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 4/13/21.
//

import UIKit

class NoTasksViewController: UIViewController {
    
    let messageLabel = UILabel()
    
    private var message = ""
    
    convenience init(message: String) {
        self.init()
        self.message = message
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageLabel.text = message
    }
    
}
