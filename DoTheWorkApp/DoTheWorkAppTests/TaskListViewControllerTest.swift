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
        XCTAssertEqual(makeSUT(header: "Header").headerLabel.text, "Header")
    }
    
    func test_viewDidLoad_rendersTasks() {
        let taskList1 = [uniqueTaskListItem(title: "Task 1")]
        let taskList2 = [uniqueTaskListItem(title: "Task 1"), uniqueTaskListItem(title: "Task 2")]
        
        XCTAssertEqual(makeSUT(taskList: []).tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSUT(taskList: taskList1).tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(makeSUT(taskList: taskList2).tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_viewDidLoad_rendersTaskText() {
        let taskList1 = [uniqueTaskListItem(title: "Task 1")]
        let taskList2 = [uniqueTaskListItem(title: "Task 1"), uniqueTaskListItem(title: "Task 2")]

        XCTAssertEqual(makeSUT(taskList: taskList1).tableView.title(at: 0), "Task 1")
        XCTAssertEqual(makeSUT(taskList: taskList2).tableView.title(at: 1), "Task 2")
    }
    
    func test_taskSelected_notifiesDelegate() {
        let taskList = [uniqueTaskListItem(title: "Task 1")]
        
        var receivedTask = ""
        let sut = makeSUT(taskList: taskList) { selectedTask in
            receivedTask = selectedTask
        }
        
        sut.tableView.select(row: 0)
        
        XCTAssertEqual(receivedTask, "Task 1")
    }
    
    // MARK:- Helpers
    private func makeSUT(header: String = "",
                         taskList: [TaskListItem] = [],
                         selection:  @escaping (String) -> Void = { _ in }) -> TaskListViewController {
        let sut = TaskListViewController(header: header, taskList: taskList, selection: selection)
        _ = sut.view
        return sut
    }
    
    private func uniqueTaskListItem(title: String = "", notifcation: Date = .init()) -> TaskListItem {
        let taskListItem = TaskListItem(title: title, notification: notifcation)
        return taskListItem
    }
    
    private func uniqueTaskList() -> [TaskListItem] {
        let taskList = [
            uniqueTaskListItem(title: "Task 1"),
            uniqueTaskListItem(title: "Task 2")
        ]
        return taskList
    }
    
}

private extension UITableView {
    func cell(at row: Int) -> UITableViewCell? {
        return dataSource?.tableView(self, cellForRowAt: IndexPath(row: row, section: 0))
    }
    
    func title(at row: Int) -> String? {
        return cell(at: row)?.textLabel?.text
    }
    
    func select(row: Int) {
        delegate?.tableView?(self, didSelectRowAt: IndexPath(row: row, section: 0))
    }
}
