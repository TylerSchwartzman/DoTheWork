//
//  iOSViewControllerFactoryTest.swift
//  DoTheWorkAppTests
//
//  Created by Tyler Schwartzman on 5/6/21.
//

import Foundation
import XCTest
@testable import DoTheWorkApp

class iOSViewControllerFactoryTest: XCTestCase {
    
    let task = Task(name: "Task 1", description: Description.text(""), notification: Date())
    
    func test_taskListViewController_createsController() {
        let sut = iOSViewControllerFactory(taskList: [task])
        
        let controller = sut.taskListViewController(for: [task]) as? TaskListViewController
        
        XCTAssertNotNil(controller)
    }
    
    func test_taskListViewController_createsControllerWithTaskList() {
        let taskList = [task]
        let sut = iOSViewControllerFactory(taskList: taskList)

        let controller = sut.taskListViewController(for: [task]) as! TaskListViewController

        XCTAssertEqual(controller.taskList, [task.name])
    }
    
    func test_noTaskViewController_createsController() {
        let sut = iOSViewControllerFactory(taskList: [])
        
        let controller = sut.noTaskViewController(for: "") as? NoTasksViewController
        
        XCTAssertNotNil(controller)
    }
    
    func test_noTaskViewController_createsControllerNoTasksWithMessage() {
        let sut = iOSViewControllerFactory(taskList: [])
        
        let controller = sut.noTaskViewController(for: "No Tasks Message") as! NoTasksViewController
        _ = controller.view
        
        XCTAssertEqual(controller.messageLabel.text, "No Tasks Message")
    }
    
}
