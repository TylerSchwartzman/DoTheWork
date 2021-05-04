//
//  NavigationControllerRouterTest.swift
//  DoTheWorkAppTests
//
//  Created by Tyler Schwartzman on 4/16/21.
//

import Foundation
import XCTest
import DoTheWork
@testable import DoTheWorkApp

class NavigationControllerRouterTest: XCTestCase {
    
    let navigationController = UINavigationController()
    let factory = ViewControllerFactoryStub()
    let viewController = UIViewController()
    let secondViewController = UIViewController()
    
    lazy var sut: NavigationControllerRouter = {
       return NavigationControllerRouter(navigationController, factory: factory)
    }()

    func test_routeToNoTasksMessage_presentsNoTasksViewController() {
        factory.stub(noTaskMessage: "No Task Message", with: viewController)
            
        sut.routeTo(noTasksMessage: "No Task Message")
        
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertEqual(navigationController.viewControllers.first, viewController)
    }
    
    func test_routeToNoTasksMessageTwice_presentsNoTasksViewControllerTwice() {
        factory.stub(noTaskMessage: "No Task Message", with: viewController)
        factory.stub(noTaskMessage: "Second No Task Message", with: secondViewController)

        sut.routeTo(noTasksMessage: "No Task Message")
        sut.routeTo(noTasksMessage: "Second No Task Message")

        XCTAssertEqual(navigationController.viewControllers.count, 2)
        XCTAssertEqual(navigationController.viewControllers.first, viewController)
        XCTAssertEqual(navigationController.viewControllers.last, secondViewController)
    }
    
    func test_routeToTaskList_presentsTaskListViewController() {
        factory.stub(taskList: ["Task 1"], with: viewController)
                
        sut.routeTo(taskList: ["Task 1"])
        
        XCTAssertEqual(navigationController.viewControllers.first, viewController)
    }
    
    func test_routeToTaskListTwice_presentsTaskListViewControllerTwicr() {
        factory.stub(taskList: ["Task 1"], with: viewController)
        factory.stub(taskList: ["Task 2"], with: secondViewController)

        sut.routeTo(taskList: ["Task 1"])
        sut.routeTo(taskList: ["Task 2"])

        XCTAssertEqual(navigationController.viewControllers.count, 2)
        XCTAssertEqual(navigationController.viewControllers.first, viewController)
        XCTAssertEqual(navigationController.viewControllers.last, secondViewController)
    }
    
    func test_routeToTask_presentsTaskViewController() {
        factory.stub(task: "Task 1", with: viewController)
                
        sut.routeTo(task: "Task 1")
        
        XCTAssertEqual(navigationController.viewControllers.first, viewController)
    }
    
    func test_routeToTaskTwice_presentsTaskViewControllerTwice() {
        factory.stub(task: "Task 1", with: viewController)
        factory.stub(task: "Task 2", with: secondViewController)
                
        sut.routeTo(task: "Task 1")
        sut.routeTo(task: "Task 2")

        XCTAssertEqual(navigationController.viewControllers.first, viewController)
        XCTAssertEqual(navigationController.viewControllers.last, secondViewController)
    }
    
    
    
    class ViewControllerFactoryStub: ViewControllerFactory {
        private var stubbedNoTaskMessages = [String: UIViewController]()
        private var stubbedTaskLists = [[String]: UIViewController]()
        private var stubbedTasks = [String: UIViewController]()

        func stub(noTaskMessage: String, with viewController: UIViewController) {
            return stubbedNoTaskMessages[noTaskMessage] = viewController
        }
        
        func stub(taskList: [String], with viewController: UIViewController) {
            return stubbedTaskLists[taskList] = viewController
        }
        
        func stub(task: String, with viewController: UIViewController) {
            return stubbedTasks[task] = viewController
        }
        
        func noTaskViewController(for noTaskMessage: String) -> UIViewController {
            return stubbedNoTaskMessages[noTaskMessage]!
        }
        
        func taskListViewController(for taskList: [String]) -> UIViewController {
            return stubbedTaskLists[taskList]!
        }
        
        func taskViewController(for task: String) -> UIViewController {
            return stubbedTasks[task]!
        }
                
    }
    
}
