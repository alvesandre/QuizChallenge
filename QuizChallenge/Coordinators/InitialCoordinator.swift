//
//  InitialCoordinator.swift
//  QuizChallenge
//
//  Created by André Alves on 08/03/20.
//  Copyright © 2020 André Alves. All rights reserved.
//

import UIKit

class InitialCoordinator: Coordinator {
    var navigation: UINavigationController
    
    required init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        let view = QuizViewController()
        let viewModel = QuizViewModel(view: view, delegate: self)
        
        self.push(viewController: viewModel.view, animated: true)
    }
    
}

// MARK:- ViewModelDelegate
extension InitialCoordinator: ViewModelDelegate {
    func showMessage(title: String, message: String) {
        self.showAlert(title: title, message: message)
    }
    func showMessageAndBack(title: String, message: String) {
        self.showAlert(title: title, message: message)
        self.pop(animated: true)
    }
    
    func backView() {
        self.pop(animated: true)
    }
    
    func backToView(with klass: AnyClass) {
        self.pop(to: klass, animated: true)
    }
    
    func showNavigation(show: Bool) {
        self.navigation.setNavigationBarHidden(!show, animated: true)
    }
}
