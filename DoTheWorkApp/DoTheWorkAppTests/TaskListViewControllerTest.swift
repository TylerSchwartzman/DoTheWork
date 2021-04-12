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
    
    func test_viewDidLoad_withOneTask_rendersOneTask() {
        XCTAssertEqual(makeSUT(taskList: []).tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSUT(taskList: ["Task 1"]).tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(makeSUT(taskList: ["Task 1", "Task 2"]).tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_viewDidLoad_rendersTaskText() {
        XCTAssertEqual(makeSUT(taskList: ["Task 1"]).tableView.title(at: 0), "Task 1")
        XCTAssertEqual(makeSUT(taskList: ["Task 1", "Task 2"]).tableView.title(at: 1), "Task 2")
    }
    
    func test_taskSelected_notifiesDelegate() {
        var receivedTask = ""
        let sut = makeSUT(taskList: ["Task 1"]) { string in
            receivedTask = string
        }
        
        let indexPath = IndexPath(row: 0, section: 0)
        sut.tableView.delegate?.tableView?(sut.tableView, didSelectRowAt: indexPath)
        
        XCTAssertEqual(receivedTask, "Task 1")
    }
    
    // MARK:- Helpers
    
    private func makeSUT(header: String = "",
                         taskList: [String] = [],
                         selection:  @escaping (String) -> Void = { _ in }) -> TaskListViewController {
        let sut = TaskListViewController(header: header, taskList: taskList, selection: selection)
        _ = sut.view
        return sut
    }
    
}

private extension UITableView {
    func cell(at row: Int) -> UITableViewCell? {
        return dataSource?.tableView(self, cellForRowAt: IndexPath(row: row, section: 0))
    }
    
    func title(at row: Int) -> String? {
        return cell(at: row)?.textLabel?.text
    }
}
