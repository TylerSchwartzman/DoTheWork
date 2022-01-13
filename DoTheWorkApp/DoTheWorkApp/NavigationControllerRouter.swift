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
    private let addTaskBarButton = UIBarButtonItem(image: UIImage(systemName: "plus.app"),
                                                   style: .plain,
                                                   target: nil,
                                                   action: nil)
    
    init(_ navigationController: UINavigationController, factory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func routeTo(taskList: [Task]) {
        let controller = factory.taskListViewController(for: taskList)
        controller.navigationItem.rightBarButtonItem = addTaskBarButton
        show(controller)
    }
    
    func routeTo(noTasksMessage: String) {
        let controller = factory.noTasksViewController(for: noTasksMessage)
        controller.navigationItem.rightBarButtonItem = addTaskBarButton
        show(controller)
    }
    
    func routeTo(task: Task) {
        show(factory.taskViewController(for: task))
    }
    
    private func show(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
}
