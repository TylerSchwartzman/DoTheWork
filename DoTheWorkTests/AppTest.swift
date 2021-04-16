//
//  AppTest.swift
//  DoTheWorkTests
//
//  Created by Tyler Schwartzman on 4/14/21.
//

import Foundation
import XCTest
import DoTheWork

class AppTest: XCTestCase {
    
    let router = RouterSpy()
    
    func test_startApp_withNoTasks_rendersNoTasksMessage() {
        startApp(router: router, taskList: [], noTasksMessage: "No Tasks.")
        
        XCTAssertEqual(router.routedNoTasksMessage, "No Tasks.")
    }
    
    func test_startApp_withOneTask_rendersTask() {
        startApp(router: router, taskList: ["Task 1"], noTasksMessage: "No Tasks.")
        
        XCTAssertEqual(router.routedTaskList, ["Task 1"])
    }
    
    func test_startApp_withTwoTasks_rendersCorrectTwoTasks() {
        startApp(router: router, taskList: ["Task 1", "Task 2"], noTasksMessage: "No Tasks.")
        
        XCTAssertEqual(router.routedTaskList, ["Task 1", "Task 2"])
    }
    
    func test_startAppTwice_withTwoTasks_rendersCorrectTwoTasks() {
        startApp(router: router, taskList: ["Task 1", "Task 2"], noTasksMessage: "No Tasks.")
        
        startApp(router: router, taskList: ["Task 1", "Task 2"], noTasksMessage: "No Tasks.")
        
        XCTAssertEqual(router.routedTaskList, ["Task 1", "Task 2", "Task 1", "Task 2"])
    }
    
}
