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

        XCTAssertTrue(router.routedTaskList.isEmpty)
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
    
    func test_startTwice_withTwoTasks_routesToCorrectTaskList() {
        let sut = makeSUT(taskList: ["Task 1", "Task 2"])
        
        sut.start()
        sut.start()

        XCTAssertEqual(router.routedTaskList, ["Task 1", "Task 2", "Task 1", "Task 2"])
    }
    
    // MARK:- Helpers
    
    func makeSUT(taskList: [String]) -> Flow {
        return Flow(router: router, taskList: taskList)
    }
    
    class RouterSpy: Router {
        var routedTaskList: [String] = []
        
        func routeTo(taskList: [String]) {
            routedTaskList.append(contentsOf: taskList)
        }
    }
    
}

