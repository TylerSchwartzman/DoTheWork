//
//  iOSViewControllerFactory.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 5/6/21.
//

import UIKit

struct TaskListItemsPresenter {
    let taskList: [Task]
    
    var list: [TaskListItem] {
        return taskList.map { task in
            return TaskListItem(title: task.title, notification: task.notification)
        }
    }
}

class iOSViewControllerFactory: ViewControllerFactory {
    
    private let taskList: [Task]
    
    init(taskList: [Task]) {
        self.taskList = taskList
    }
    
    func noTasksViewController(for noTaskMessage: String) -> UIViewController {
        return NoTasksViewController(message: noTaskMessage)
    }
    
    func taskListViewController(for taskList: [Task]) -> UIViewController {
        let presenter = TaskListItemsPresenter(taskList: taskList)
        return TaskListViewController(header: "", taskList: presenter.list, selection: { _ in })
    }
    
    func taskViewController(for task: Task) -> UIViewController {
        return UIViewController()
    }
}
