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
        let sut = iOSViewControllerFactory()
        
        let controller = sut.taskListViewController(for: [task]) as? TaskListViewController
        
        XCTAssertNotNil(controller)
    }
    
}
