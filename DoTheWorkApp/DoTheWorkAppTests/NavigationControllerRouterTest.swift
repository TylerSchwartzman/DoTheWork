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
    
    let task1 = Task(name: "Task 1", description: Description.text(""), notification: Date())
    let task2 = Task(name: "Task 2", description: Description.text(""), notification: Date())
    
    let navigationController = NonAnimatedNavigationController()
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
        factory.stub(taskList: [task1], with: viewController)
                
        sut.routeTo(taskList: [task1])
        
        XCTAssertEqual(navigationController.viewControllers.first, viewController)
    }
    
    func test_routeToTaskListTwice_presentsTaskListViewControllerTwicr() {
        factory.stub(taskList: [task1], with: viewController)
        factory.stub(taskList: [task2], with: secondViewController)

        sut.routeTo(taskList: [task1])
        sut.routeTo(taskList: [task2])

        XCTAssertEqual(navigationController.viewControllers.count, 2)
        XCTAssertEqual(navigationController.viewControllers.first, viewController)
        XCTAssertEqual(navigationController.viewControllers.last, secondViewController)
    }
    
    func test_routeToTask_presentsTaskViewController() {
        factory.stub(task: task1, with: viewController)
                
        sut.routeTo(task: task1)
        
        XCTAssertEqual(navigationController.viewControllers.first, viewController)
    }
    
    func test_routeToTaskTwice_presentsTaskViewControllerTwice() {
        factory.stub(task: task1, with: viewController)
        factory.stub(task: task2, with: secondViewController)
                
        sut.routeTo(task: task1)
        sut.routeTo(task: task2)

        XCTAssertEqual(navigationController.viewControllers.first, viewController)
        XCTAssertEqual(navigationController.viewControllers.last, secondViewController)
    }
    
    
    class NonAnimatedNavigationController: UINavigationController {
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            super.pushViewController(viewController, animated: false)
        }
    }
    
    class ViewControllerFactoryStub: ViewControllerFactory {
        private var stubbedNoTaskMessages = [String: UIViewController]()
        private var stubbedTaskLists = [[Task]: UIViewController]()
        private var stubbedTasks = [Task: UIViewController]()

        func stub(noTaskMessage: String, with viewController: UIViewController) {
            return stubbedNoTaskMessages[noTaskMessage] = viewController
        }
        
        func stub(taskList: [Task], with viewController: UIViewController) {
            return stubbedTaskLists[taskList] = viewController
        }
        
        func stub(task: Task, with viewController: UIViewController) {
            return stubbedTasks[task] = viewController
        }
        
        func noTaskViewController(for noTaskMessage: String) -> UIViewController {
            return stubbedNoTaskMessages[noTaskMessage]!
        }
        
        func taskListViewController(for taskList: [Task]) -> UIViewController {
            return stubbedTaskLists[taskList]!
        }
        
        func taskViewController(for task: Task) -> UIViewController {
            return stubbedTasks[task]!
        }
                
    }
    
}

// For test purposes
extension Task: Hashable {
    public func hash(into hasher: inout Hasher) {}
    
    public static func == (lhs: Task, rhs: Task) -> Bool {
        lhs.name == rhs.name
    }
}
