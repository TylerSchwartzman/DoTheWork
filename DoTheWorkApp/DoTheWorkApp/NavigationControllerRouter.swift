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
        show(factory.taskListViewController(for: taskList))
    }
    
    func routeTo(noTasksMessage: String) {
        show(factory.noTaskViewController(for: noTasksMessage))
    }
    
    func routeTo(task: String) {
        show(factory.taskViewController(for: task))
    }
    
    private func show(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
}
