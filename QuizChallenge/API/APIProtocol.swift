//
//  APIProtocol.swift
//  QuizChallenge
//
//  Created by André Alves on 09/03/20.
//  Copyright © 2020 André Alves. All rights reserved.
//

import Foundation

protocol APIProtocol {
     func getQuestion(completionBlock: @escaping QuestionCompletionBlock)
}
