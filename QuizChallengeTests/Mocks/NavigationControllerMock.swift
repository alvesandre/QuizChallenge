//
//  NavigationControllerMock.swift
//  QuizChallengeTests
//
//  Created by André Alves on 09/03/20.
//  Copyright © 2020 André Alves. All rights reserved.
//

import UIKit

@testable import QuizChallenge

class NavigationControllerMock: UINavigationController {
    var numberOfCallsPopToViewController: Int = 0
    var numberOfCallsPopViewController: Int = 0
    var numberOfCallsPushViewController: Int = 0
    var numberOfCallsPresent: Int = 0
    var numberOfCallsSetNavigationBarHidden: Int = 0
    
    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        numberOfCallsPopToViewController += 1
        return nil
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        numberOfCallsPopViewController += 1
        return nil
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        numberOfCallsPushViewController += 1
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        numberOfCallsPresent += 1
    }
    
    override func setNavigationBarHidden(_ hidden: Bool, animated: Bool) {
        numberOfCallsSetNavigationBarHidden += 1
    }
}
