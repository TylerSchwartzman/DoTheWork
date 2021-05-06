//
//  NavigationControllerRouter.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 4/16/21.
//

import UIKit
import DoTheWork

protocol ViewControllerFactory {
    func noTaskViewController(for noTaskMessage: String) -> UIViewController
    func taskListViewController(for taskList: [String]) -> UIViewController
    func taskViewController(for task: String) -> UIViewController
}

class NavigationControllerRouter: Router {
    private let navigationController: UINavigationController
    private let factory: ViewControllerFactory
    
    init(_ navigationController: UINavigationController, factory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func routeTo(taskList: [String]) {
        let viewController = factory.taskListViewController(for: taskList)
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func routeTo(noTasksMessage: String) {
        let viewController = factory.noTaskViewController(for: noTasksMessage)
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func routeTo(task: String) {
        let viewController = factory.taskViewController(for: task)
        navigationController.pushViewController(viewController, animated: false)
    }
}
