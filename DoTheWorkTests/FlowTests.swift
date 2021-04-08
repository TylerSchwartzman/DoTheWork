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
    
    func test_start_withNoTasks_doesNotRouteToTaskList() {
        let router = RouterSpy()
        let sut = Flow(router: router, taskList: [])

        sut.start()

        XCTAssertTrue(router.routedTaskList.isEmpty)
    }
    
    func test_start_withOneTask_routesToCorrectTaskList() {
        let router = RouterSpy()
        let sut = Flow(router: router, taskList: ["Task 1"])
        
        sut.start()
        
        XCTAssertEqual(router.routedTaskList, ["Task 1"])
    }
    
    func test_start_withOneTask_routesToCorrectTaskList_2() {
        let router = RouterSpy()
        let sut = Flow(router: router, taskList: ["Task 2"])
        
        sut.start()
        
        XCTAssertEqual(router.routedTaskList, ["Task 2"])
    }
    
    func test_start_withTwoTasks_routesToCorrectTaskList() {
        let router = RouterSpy()
        let sut = Flow(router: router, taskList: ["Task 1", "Task 2"])
        
        sut.start()
        
        XCTAssertEqual(router.routedTaskList, ["Task 1", "Task 2"])
    }
    
    func test_startTwice_withTwoTasks_routesToCorrectTaskList() {
        let router = RouterSpy()
        let sut = Flow(router: router, taskList: ["Task 1", "Task 2"])
        
        sut.start()
        sut.start()

        XCTAssertEqual(router.routedTaskList, ["Task 1", "Task 2", "Task 1", "Task 2"])
    }
    
    
    
    class RouterSpy: Router {
        var routedTaskList: [String] = []
        
        func routeTo(taskList: [String]) {
            routedTaskList.append(contentsOf: taskList)
        }
    }
    
}

