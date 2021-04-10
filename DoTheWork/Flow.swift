//
//  Flow.swift
//  DoTheWork
//
//  Created by Tyler Schwartzman on 4/7/21.
//

import Foundation

protocol Router {
    func routeTo(taskList: [String])
    func routeTo(noTasksMessage: String)
}

class Flow {
    let router: Router
    let taskList: [String]
    let noTasksMessage: String
    
    init(router: Router, taskList: [String], noTasksMessage: String) {
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
}
