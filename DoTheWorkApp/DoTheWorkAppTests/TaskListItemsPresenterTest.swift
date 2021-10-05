//
//  TaskListItemsPresenterTest.swift
//  DoTheWorkAppTests
//
//  Created by Tyler Schwartzman on 5/12/21.
//

import Foundation
import XCTest
@testable import DoTheWorkApp

class TaskListItemsPresenterTest: XCTestCase {
    
    func test_list_withNoTasks_isEmpty() {
        let taskList: [Task] = []
        
        let sut = TaskListItemsPresenter(taskList: taskList)
        
        XCTAssertTrue(sut.list.isEmpty)
    }
    
    func test_list_withTasks_mapsTaskListItemList() {
        let taskList = makeTaskList()
        
        let sut = TaskListItemsPresenter(taskList: taskList)
        
        XCTAssertEqual(sut.list.count, taskList.count)
    }
    
    func test_list_withTasks_mapsCorrectTaskListItemList() {
        let taskList = makeTaskList()
        
        let sut = TaskListItemsPresenter(taskList: taskList)
        
        XCTAssertEqual(sut.list.first!.title, taskList.first!.title)
        XCTAssertEqual(sut.list.last!.title, taskList.last!.title)
    }
    
    // MARK: Helpers
    
    private func makeTaskList() -> [Task] {
        return [Task(title: "Task 1", description: Description.text(""), notification: Date()),
                Task(title: "Task 2", description: Description.text(""), notification: Date())]
    }
    
}
