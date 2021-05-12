//
//  ViewControllerFactory.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 5/6/21.
//

import UIKit
import DoTheWork

protocol ViewControllerFactory {
    func noTasksViewController(for noTaskMessage: String) -> UIViewController
    func taskListViewController(for taskList: [Task]) -> UIViewController
    func taskViewController(for task: Task) -> UIViewController
}
