//
//  QuizViewControllerMock.swift
//  QuizChallengeTests
//
//  Created by André Alves on 09/03/20.
//  Copyright © 2020 André Alves. All rights reserved.
//

import Foundation

@testable import QuizChallenge

class QuizViewControllerMock: QuizViewController {
    var numberOfCallsShowLoading: Int = 0
    var numberOfCallsConfigureView: Int = 0
    
    override func showLoading(show: Bool) {
        numberOfCallsShowLoading += 1
    }
    
    override func configureView(with content: (question: String, answers: [String])) {
        numberOfCallsConfigureView += 1
    }
}
