//
//  Flow.swift
//  DoTheWork
//
//  Created by Tyler Schwartzman on 4/7/21.
//

import Foundation

protocol Router {
    func routeTo(taskList: [String])
}

class Flow {
    let router: Router
    let taskList: [String]
    
    init(router: Router, taskList: [String]) {
        self.router = router
        self.taskList = taskList
    }
    
    func start() {
        if !taskList.isEmpty {
            router.routeTo(taskList: taskList)
        }
    }
}
