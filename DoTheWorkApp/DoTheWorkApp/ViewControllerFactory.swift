//
//  ViewControllerFactory.swift
//  DoTheWorkApp
//
//  Created by Tyler Schwartzman on 5/6/21.
//

import Foundation

protocol ViewControllerFactory {
    func noTaskViewController(for noTaskMessage: String) -> UIViewController
    func taskListViewController(for taskList: [Task]) -> UIViewController
    func taskViewController(for task: Task) -> UIViewController
}
