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
        let taskList = [Task(title: "Task 1", description: Description.text(""), notification: Date())]
        let taskList2 = [Task(title: "", description: Description.text(""), notification: Date()), Task(title: "", description: Description.text(""), notification: Date())]
        
        let sut = TaskListItemsPresenter(taskList: taskList)
        let sut2 = TaskListItemsPresenter(taskList: taskList2)
        
        XCTAssertEqual(sut.list.count, taskList.count)
        XCTAssertEqual(sut2.list.count, taskList2.count)
        
    }
    
    func test_list_withTasks_mapsCorrectTaskListItemList() {
        let taskList = [Task(title: "Task 1", description: Description.text(""), notification: Date()), Task(title: "Task 2", description: Description.text(""), notification: Date())]
        
        let sut = TaskListItemsPresenter(taskList: taskList)
        
        XCTAssertEqual(sut.list.first!.title, taskList.first!.title)
        XCTAssertEqual(sut.list.last!.title, taskList.last!.title)
    }
    
    
}
