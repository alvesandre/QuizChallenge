//
//  QuizViewControllerDelegate.swift
//  QuizChallenge
//
//  Created by André Alves on 08/03/20.
//  Copyright © 2020 André Alves. All rights reserved.
//

import Foundation

protocol QuizViewControllerDelegate: ViewControllerDelegate {
    func showError(correctAnswers: Int, totalAnswers: Int)
    func showSuccess()
}
