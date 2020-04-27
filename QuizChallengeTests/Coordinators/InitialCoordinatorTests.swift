//
//  InitialCoordinatorTests.swift
//  QuizChallengeTests
//
//  Created by André Alves on 09/03/20.
//  Copyright © 2020 André Alves. All rights reserved.
//

import XCTest

@testable import QuizChallenge

class InitialCoordinatorTests: XCTestCase {

    var sut: InitialCoordinator?
    let navigation = NavigationControllerMock()
    
    override func setUp() {
        sut = InitialCoordinator(navigation: navigation)
    }

    override func tearDown() {
        sut = nil
    }
    
    func testStart() {
        sut?.start()
        
        XCTAssertEqual(navigation.numberOfCallsPushViewController, 1)
    }
    
    func testShowMessage() {
        sut?.showMessage(title: "", message: "")
        
        XCTAssertEqual(navigation.numberOfCallsPresent, 1)
    }
    
    func testShowMessageAndBack() {
        sut?.showMessageAndBack(title: "", message: "")
        
        XCTAssertEqual(navigation.numberOfCallsPresent, 1)
        XCTAssertEqual(navigation.numberOfCallsPopViewController, 1)
    }
    
    func testBackView() {
        sut?.backView()
        
        XCTAssertEqual(navigation.numberOfCallsPopViewController, 1)
    }
    
    func testBackToView() {
        navigation.viewControllers.append(QuizViewControllerMock())
        
        sut?.backToView(with: QuizViewController.self)
        
        XCTAssertEqual(navigation.numberOfCallsPopToViewController, 1)
    }
    
    func testShowNavigation() {
        sut?.showNavigation(show: true)
        
        XCTAssertEqual(navigation.numberOfCallsSetNavigationBarHidden, 1)
    }

}
