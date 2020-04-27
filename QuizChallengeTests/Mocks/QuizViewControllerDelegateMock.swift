//
//  QuizViewControllerDelegateMock.swift
//  QuizChallengeTests
//
//  Created by André Alves on 09/03/20.
//  Copyright © 2020 André Alves. All rights reserved.
//

import Foundation

@testable import QuizChallenge

class QuizViewControllerDelegateMock: ViewControllerDelegate, QuizViewControllerDelegate {
    
    var numberOfCallsShowError: Int = 0
    var numberOfCallsShowShowSuccess: Int = 0
    
    func showError(correctAnswers: Int, totalAnswers: Int) {
        numberOfCallsShowError += 1
    }
    
    func showSuccess() {
        numberOfCallsShowShowSuccess += 1
    }
}
