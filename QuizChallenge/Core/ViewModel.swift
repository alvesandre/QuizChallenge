//
//  ViewModel.swift
//  QuizChallenge
//
//  Created by André Alves on 07/03/20.
//  Copyright © 2020 André Alves. All rights reserved.
//

import UIKit

protocol ViewModelDelegate {
    func showMessage(title: String, message: String)
    func showMessageAndBack(title: String, message: String)
    func backView()
    func backToView(with klass: AnyClass)
    func showNavigation(show: Bool)
}

protocol ViewModel {
    func willAppear()
    func didAppear()
    func willDisappear()
    func didDisappear()
}

extension ViewModel {
    func willAppear() {}
    func didAppear() {}
    func willDisappear() {}
    func didDisappear() {}
}
