//
//  NavigationControllerRouter.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 4/16/21.
//

import UIKit
import DoTheWork

class NavigationControllerRouter: Router {
    private let navigationController: UINavigationController
    private let factory: ViewControllerFactory
    
    init(_ navigationController: UINavigationController, factory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func routeTo(taskList: [Task]) {
        show(factory.taskListViewController(for: taskList))
    }
    
    func routeTo(noTasksMessage: String) {
        show(factory.noTasksViewController(for: noTasksMessage))
    }
    
    func routeTo(task: Task) {
        show(factory.taskViewController(for: task))
    }
    
    private func show(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
}
