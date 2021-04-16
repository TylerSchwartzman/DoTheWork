//
//  App.swift
//  DoTheWork
//
//  Created by Tyler Schwartzman on 4/14/21.
//

import Foundation

public func startApp<Task, NoTaskMessage, R: Router>(router: R, taskList: [Task], noTasksMessage: NoTaskMessage) where R.Task == Task, R.NoTaskMessage == NoTaskMessage {
    let flow = MainFlow(router: router, taskList: taskList, noTasksMessage: noTasksMessage)
    flow.start()
}

public func routeToTaskList<Task, R: Router>(router: R, taskList: [Task]) where R.Task == Task {
//    let flow =
}
