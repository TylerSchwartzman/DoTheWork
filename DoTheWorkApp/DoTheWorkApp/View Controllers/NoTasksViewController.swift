//
//  NoTasksViewController.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 4/13/21.
//

import UIKit

class NoTasksViewController: UIViewController {
    
    let messageLabel = UILabel.makeLabel(for: .headline)
    
    private var message = ""
    
    convenience init(message: String) {
        self.init()
        self.message = message
    }
    
    override func loadView() {
        view = messageLabel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        messageLabel.text = message
        messageLabel.textAlignment = .center
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.center = messageLabel.center
    }
    
}
