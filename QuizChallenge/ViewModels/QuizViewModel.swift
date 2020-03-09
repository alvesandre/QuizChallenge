//
//  QuizViewModel.swift
//  QuizChallenge
//
//  Created by André Alves on 08/03/20.
//  Copyright © 2020 André Alves. All rights reserved.
//

import UIKit

class QuizViewModel: ViewModel {
    let view: QuizViewController
    
    private let delegate: ViewModelDelegate
    
    init(view: QuizViewController, delegate: ViewModelDelegate) {
        self.view = view
        self.delegate = delegate
        self.view.delegate = self
    }
    
    private func getQuestion(complete: @escaping (Result<Question?, Error>) -> Void) {
        view.showLoading(show: true)
        API.shared.getQuestion { (question, error) in
            self.view.showLoading(show: false)
            if let error = error {
                complete(.failure(error))
            } else {
                complete(.success(question))
            }
        }
    }
    
}

// MARK:- ViewControllerDelegate
extension QuizViewModel: QuizViewControllerDelegate {
    func viewWillAppear() {
        delegate.showNavigation(show: false)
        getQuestion {
            switch $0 {
            case .success(let question):
                if let question = question {
                    self.view.configureView(with: (question: question.question, answers: question.answer))
                } else {
                    self.delegate.showMessage(title: "Error", message: "Service unavailable")
                }
            case .failure(let error):
                self.delegate.showMessage(title: "Error", message: error.localizedDescription)
            }
        }
    }
    
    func showSuccess() {
        delegate.showMessage(title: "Congratulations", message: "Good job! You found all the answers on time. Keep up with the great work.")
    }
    
    func showError(correctAnswers: Int, totalAnswers: Int) {
        delegate.showMessage(title: "Time finished", message: "Sorry, time is up! You got \(String(correctAnswers)) out of \(String(totalAnswers)) answers.")
    }
}
