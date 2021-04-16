//
//  App.swift
//  DoTheWork
//
//  Created by Tyler Schwartzman on 4/14/21.
//

import Foundation

public func startApp<Task, NoTaskMessage, R: Router>(router: R, taskList: [Task], noTasksMessage: NoTaskMessage) where R.Task == Task, R.NoTaskMessage == NoTaskMessage {
    let flow = Flow(router: router, taskList: taskList, noTasksMessage: noTasksMessage)
    flow.start()
}
