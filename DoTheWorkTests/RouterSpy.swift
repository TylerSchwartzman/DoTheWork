//
//  RouterSpy.swift
//  DoTheWorkTests
//
//  Created by Tyler Schwartzman on 4/15/21.
//

import Foundation
import DoTheWork

class RouterSpy: Router {
    var routedTaskList: [String] = []
    var routedNoTasksMessage: String? = nil
    var routedTasks: [String] = []
    
    func routeTo(taskList: [String]) {
        routedTaskList.append(contentsOf: taskList)
    }
    
    func routeTo(noTasksMessage: String) {
        routedNoTasksMessage = noTasksMessage
    }
    
    func routeTo(task: String) {
        routedTasks.append(task)
    }
}
