//
//  Flow.swift
//  DoTheWork
//
//  Created by Tyler Schwartzman on 4/7/21.
//

import Foundation

class Flow <Task, NoTaskMessage, R: Router> where R.Task == Task, R.NoTaskMessage == NoTaskMessage {
    let router: R
    let taskList: [Task]
    let noTasksMessage: NoTaskMessage
    
    init(router: R, taskList: [Task], noTasksMessage: NoTaskMessage) {
        self.router = router
        self.taskList = taskList
        self.noTasksMessage = noTasksMessage
    }
    
    func start() {
        if taskList.isEmpty {
            router.routeTo(noTasksMessage: noTasksMessage)
        } else {
            router.routeTo(taskList: taskList)
        }
    }
    
    func routeToTask(_ task: Task) {
        router.routeTo(task: task)
    }
    
    func routeToTaskList(_ taskList: [Task]) {
        router.routeTo(taskList: taskList)
    }
    
}
