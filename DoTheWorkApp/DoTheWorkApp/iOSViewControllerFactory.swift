//
//  iOSViewControllerFactory.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 5/6/21.
//

import UIKit

class iOSViewControllerFactory: ViewControllerFactory {
    func noTaskViewController(for noTaskMessage: String) -> UIViewController {
        return UIViewController()
    }
    
    func taskListViewController(for taskList: [Task]) -> UIViewController {
        return TaskListViewController()
    }
    
    func taskViewController(for task: Task) -> UIViewController {
        return UIViewController()
    }
}
