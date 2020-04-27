//
//  Coordinator.swift
//  QuizChallenge
//
//  Created by André Alves on 07/03/20.
//  Copyright © 2020 André Alves. All rights reserved.
//

import UIKit

protocol Coordinator {
    var navigation: UINavigationController { get }
    
    init(navigation: UINavigationController) 
    
    func start()
    func push(viewController: UIViewController, animated: Bool)
    func present(viewController: UIViewController, animated: Bool)
    func pop(animated: Bool)
    func pop(to klass: AnyClass, animated: Bool)
    func showAlert(title: String, message: String)
}

extension Coordinator {
    func push(viewController: UIViewController, animated: Bool = true) {
        self.navigation.pushViewController(viewController, animated: animated)
    }
    func present(viewController: UIViewController, animated: Bool) {
        self.navigation.present(viewController, animated: animated)
    }
    func pop(animated: Bool = true) {
        self.navigation.popViewController(animated: animated)
    }
    func pop(to klass: AnyClass, animated: Bool) {
        if let view = navigation.viewControllers.first(where: { $0.isKind(of: klass)}) {
            self.navigation.popToViewController(view, animated: animated)
        }
    }
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.present(viewController: alert, animated: true)
    }
}
