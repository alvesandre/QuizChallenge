//
//  ViewControllerDelegateMock.swift
//  QuizChallengeTests
//
//  Created by André Alves on 09/03/20.
//  Copyright © 2020 André Alves. All rights reserved.
//

import Foundation

@testable import QuizChallenge

class ViewControllerDelegateMock: ViewControllerDelegate {
    var numberOfCallsViewWillAppear: Int = 0
    var numberOfCallsViewDidAppear: Int = 0
    var numberOfCallsViewWillDisappear: Int = 0
    var numberOfCallsViewDidDisappear: Int = 0
    
    func viewWillAppear() {
        numberOfCallsViewWillAppear += 1
    }
    
    func viewDidAppear() {
        numberOfCallsViewDidAppear += 1
    }
    
    func viewWillDisappear() {
        numberOfCallsViewWillDisappear += 1
    }
    
    func viewDidDisappear() {
        numberOfCallsViewDidDisappear += 1
    }
}
