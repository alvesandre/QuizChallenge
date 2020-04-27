//
//  QuizViewModel.swift
//  QuizChallengeTests
//
//  Created by André Alves on 09/03/20.
//  Copyright © 2020 André Alves. All rights reserved.
//

import XCTest

@testable import QuizChallenge

class QuizViewModelTests: XCTestCase {
    
    var sut: QuizViewModel?
    let delegate = ViewModelDelegateMock()
    let view = QuizViewControllerMock()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = QuizViewModel(view: view, delegate: delegate)
    }

    override func tearDown() {
        sut = nil
    }
    
    func testWillAppearSuccess() {
        API.shared = APISuccessMock()
        
        sut = QuizViewModel(view: view, delegate: delegate)
        
        sut?.viewWillAppear()
        
        XCTAssertEqual(view.numberOfCallsShowLoading, 2)
        XCTAssertEqual(view.numberOfCallsConfigureView, 1)
        
    }
    
    func testWillAppearError() {
        API.shared = APIErrorMock()

        sut = QuizViewModel(view: view, delegate: delegate)

        sut?.viewWillAppear()

        XCTAssertEqual(delegate.numberOfCallsShowMessage, 1)
           
    }
    
    func testWillAppearWithoutData() {
        API.shared = APISucessWithoutDataMock()

        sut = QuizViewModel(view: view, delegate: delegate)

        sut?.viewWillAppear()

        XCTAssertEqual(delegate.numberOfCallsShowMessage, 1)
           
    }
    
    func testShowSucess() {
        sut?.showSuccess()

        XCTAssertEqual(delegate.numberOfCallsShowMessage, 1)
           
    }
    
    func testShowError() {
        sut?.showError(correctAnswers: 0, totalAnswers: 0)

        XCTAssertEqual(delegate.numberOfCallsShowMessage, 1)
           
    }

}
