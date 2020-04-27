//
//  APIMock.swift
//  QuizChallengeTests
//
//  Created by André Alves on 09/03/20.
//  Copyright © 2020 André Alves. All rights reserved.
//

import Foundation

@testable import QuizChallenge

class APISuccessMock: APIProtocol {
    func getQuestion(completionBlock: @escaping QuestionCompletionBlock) {
        let question = Question(question: "test", answer: ["1","2","3"])
        completionBlock(question, nil)
    }
}

class APISucessWithoutDataMock: APIProtocol {
    func getQuestion(completionBlock: @escaping QuestionCompletionBlock) {
        completionBlock(nil, nil)
    }
}

class APIErrorMock: APIProtocol {
    func getQuestion(completionBlock: @escaping QuestionCompletionBlock) {
        let error = NSError(domain: "", code: 401, userInfo: nil)
        completionBlock(nil, error)
    }
}
