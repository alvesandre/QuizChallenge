//
//  ViewModelDelegateMock.swift
//  QuizChallengeTests
//
//  Created by André Alves on 09/03/20.
//  Copyright © 2020 André Alves. All rights reserved.
//

import Foundation

@testable import QuizChallenge

class ViewModelDelegateMock: ViewModelDelegate {
    var numberOfCallsShowMessage: Int = 0
    var numberOfCallsShowMessageAndBack: Int = 0
    var numberOfCallsBackView: Int = 0
    var numberOfCallsBackToView: Int = 0
    var numberOfCallsShowNavigation: Int = 0
    
    func showMessage(title: String, message: String) {
        numberOfCallsShowMessage += 1
    }
    
    func showMessageAndBack(title: String, message: String) {
        numberOfCallsShowMessageAndBack += 1
    }
    
    func backView() {
        numberOfCallsBackView += 1
    }
    
    func backToView(with klass: AnyClass) {
        numberOfCallsBackToView += 1
    }
    
    func showNavigation(show: Bool) {
        numberOfCallsShowNavigation += 1
    }
}
