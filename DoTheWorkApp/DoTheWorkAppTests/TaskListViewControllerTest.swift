//
//  TaskListViewControllerTest.swift
//  DoTheWorkAppTests
//
//  Created by Tyler Schwartzman on 4/11/21.
//

import Foundation
import XCTest
@testable import DoTheWorkApp

class TaskListViewControllerTest: XCTestCase {
    
    func test_viewDidLoad_rendersTaskListHeaderText() {
        let sut = TaskListViewController(header: "Header", taskList: [])
        
        _ = sut.view
        
        XCTAssertEqual(sut.headerLabel.text, "Header")
    }
    
    func test_viewDidLoad_withOneTask_rendersOneTask() {
        let sut = TaskListViewController(header: "Header", taskList: ["Task 1"])
        
        _ = sut.view
        
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
    
    func test_viewDidLoad_withOneTask_rendersOneTaskText() {
        let sut = TaskListViewController(header: "Header", taskList: ["Task 1"])
        
        _ = sut.view
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: indexPath)
        
        XCTAssertEqual(cell?.textLabel?.text, "Task 1")
    }
    
}
