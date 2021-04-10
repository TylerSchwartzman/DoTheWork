//
//  FlowTests.swift
//  DoTheWorkTests
//
//  Created by Tyler Schwartzman on 4/7/21.
//

import Foundation
import XCTest
@testable import DoTheWork

class FlowTest: XCTestCase {
    
    let router = RouterSpy()
    
    func test_start_withNoTasks_doesNotRouteToTaskList() {
        makeSUT(taskList: []).start()

        XCTAssertEqual(router.routedTaskList, [])
    }
    
    func test_start_withNoTasks_routesToCorrectNoTasksMessage() {
        let message = "There are no tasks to be completed."
        makeSUT(taskList: [], noTasksMessage: message).start()
        
        XCTAssertEqual(router.routedNoTasksMessage, message)
    }
    
    func test_startTwice_withNoTasks_routesToCorrectNoTasksMessage() {
        let message = "There are no tasks to be completed."
        let sut = makeSUT(taskList: [], noTasksMessage: message)
        
        sut.start()
        sut.start()

        XCTAssertEqual(router.routedNoTasksMessage, message)
    }
    
    func test_start_withOneTask_doesNotRouteToNoTasksMessage() {
        let taskList = ["Task 1"]
        makeSUT(taskList: taskList).start()

        XCTAssertNil(router.routedNoTasksMessage)
    }
    
    func test_start_withOneTask_routesToCorrectTaskList() {
        let taskList = ["Task 1"]
        makeSUT(taskList: taskList).start()
                
        XCTAssertEqual(router.routedTaskList, taskList)
    }
    
    func test_start_withOneTask_routesToCorrectTaskList_2() {
        let taskList = ["Task 2"]
        makeSUT(taskList: taskList).start()
        
        XCTAssertEqual(router.routedTaskList, taskList)
    }
    
    func test_start_withTwoTasks_routesToCorrectTaskList() {
        let taskList = ["Task 1", "Task 2"]
        makeSUT(taskList: taskList).start()
        
        XCTAssertEqual(router.routedTaskList, taskList)
    }
    
    func test_startTwice_withTwoTasks_routesToCorrectTaskListTwice() {
        let sut = makeSUT(taskList: ["Task 1", "Task 2"])
        
        sut.start()
        sut.start()

        XCTAssertEqual(router.routedTaskList, ["Task 1", "Task 2", "Task 1", "Task 2"])
    }

    func test_routeToTask_routesToCorrectTask() {
        makeSUT(taskList: ["Task 1", "Task 2"]).routeToTask("Task 1")
        
        XCTAssertEqual(router.routedTasks, ["Task 1"])
    }
    
    func test_routeToTask_routesToCorrectTask_2() {
        makeSUT(taskList: ["Task 1", "Task 2"]).routeToTask("Task 2")
        
        XCTAssertEqual(router.routedTasks, ["Task 2"])
    }
    
    func test_routeToTaskTwice_routesToCorrectTaskTwice() {
        let sut = makeSUT(taskList: ["Task 1", "Task 2"])

        sut.routeToTask("Task 1")
        sut.routeToTask("Task 1")

        XCTAssertEqual(router.routedTasks, ["Task 1", "Task 1"])
    }
    
    // MARK:- Helpers
    
    func makeSUT(taskList: [String], noTasksMessage: String? = nil) -> Flow {
        return Flow(router: router, taskList: taskList, noTasksMessage: noTasksMessage ?? "")
    }
    
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
    
}

