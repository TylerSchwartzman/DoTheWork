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
    
    func test_viewDidLoad_rendersHeaderViewText() {
        let headerText = "Header"
        let sut = makeSUT(header: headerText)
        
        let headerView = sut.tableView.taskListHeaderView(section: 0) as? HeaderView
        
        XCTAssertNotNil(headerView)
        XCTAssertEqual(headerText, headerView?.label.text)
    }
    
    func test_viewDidLoad_rendersTasks() {
        let taskList1 = [makeTaskListItem(title: "Task 1")]
        let taskList2 = [makeTaskListItem(title: "Task 1"), makeTaskListItem(title: "Task 2")]
        
        XCTAssertEqual(makeSUT(taskList: []).tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSUT(taskList: taskList1).tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(makeSUT(taskList: taskList2).tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_viewDidLoad_withTask_ConfiguresCell() {
        let date = Date()
        let sut = makeSUT(taskList: [makeTaskListItem(title: "Task 1", notifcation: date)])
        
        let cell = sut.tableView.cell(at: 0) as? TaskItemCell
        
        XCTAssertNotNil(cell)
        assertEqual(cell, "Task 1", date)
    }
    
    func test_viewDidLoad_withTwoTasks_rendersCorrectText() {
        let date = Date()
        let sut = makeSUT(taskList: [makeTaskListItem(title: "Task 1", notifcation: date),
                                     makeTaskListItem(title: "Task 2", notifcation: date)])

        let firstCell = sut.tableView.cell(at: 0) as? TaskItemCell
        let secondCell = sut.tableView.cell(at: 1) as? TaskItemCell

        XCTAssertNotNil(firstCell)
        XCTAssertNotNil(secondCell)
        assertEqual(firstCell, "Task 1", date)
        assertEqual(secondCell, "Task 2", date)
    }

    func test_taskSelected_notifiesDelegate() {
        let taskList = [makeTaskListItem(title: "Task 1")]

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
    
    private func makeTaskListItem(title: String = "", notifcation: Date = .init()) -> TaskListItem {
        return TaskListItem(title: title, notification: notifcation)
    }
    
    private func assertEqual(_ cell: TaskItemCell?, _ text: String, _ date: Date) {
        XCTAssertEqual(cell?.titleLabel.text, text)
        XCTAssertEqual(cell?.notificationLabel.text, String(describing: date))
    }
    
}

private extension UITableView {
    func cell(at row: Int) -> UITableViewCell? {
        return dataSource?.tableView(self, cellForRowAt: IndexPath(row: row, section: 0))
    }
    
    func select(row: Int) {
        delegate?.tableView?(self, didSelectRowAt: IndexPath(row: row, section: 0))
    }
    
    func taskListHeaderView(section: Int) -> UIView? {
        return delegate?.tableView?(self, viewForHeaderInSection: section)
    }
}
