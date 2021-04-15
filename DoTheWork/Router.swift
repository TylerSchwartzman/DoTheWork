//
//  Router.swift
//  DoTheWork
//
//  Created by Tyler Schwartzman on 4/14/21.
//

import Foundation

public protocol Router {
    associatedtype Task
    associatedtype NoTaskMessage
    
    func routeTo(taskList: [Task])
    func routeTo(noTasksMessage: NoTaskMessage)
    func routeTo(task: Task)
}
