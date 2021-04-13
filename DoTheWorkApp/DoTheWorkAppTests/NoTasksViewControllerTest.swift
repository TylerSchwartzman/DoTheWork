//
//  NoTasksViewControllerTest.swift
//  DoTheWorkAppTests
//
//  Created by Tyler Schwartzman on 4/13/21.
//

import Foundation
import XCTest
@testable import DoTheWorkApp

class NoTasksViewControllerTest: XCTestCase {
    
    
    func test_viewDidLoad_rendersNoTasksMessage() {
        let sut = NoTasksViewController(message: "Header Text")
        
        _ = sut.view
        
        XCTAssertEqual(sut.messageLabel.text, "Header Text")
    }

    
    
    
}
