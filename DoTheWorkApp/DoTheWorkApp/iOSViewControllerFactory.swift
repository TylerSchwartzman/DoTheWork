//
//  iOSViewControllerFactory.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 5/6/21.
//

import UIKit
import DoTheWork

class iOSViewControllerFactory: ViewControllerFactory {
    
    private let taskList: [Task]
    
    init(taskList: [Task]) {
        self.taskList = taskList
    }
    
    func noTasksViewController(for noTaskMessage: String) -> UIViewController {
        return NoTasksViewController(message: noTaskMessage)
    }
    
    func taskListViewController(for taskList: [Task]) -> UIViewController {
        return TaskListViewController(header: "", taskList: taskList, selection: { _ in })
    }
    
    func taskViewController(for task: Task) -> UIViewController {
        return UIViewController()
    }
}
