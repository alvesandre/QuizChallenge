//
//  AppDelegate.swift
//  QuizChallenge
//
//  Created by André Alves on 07/03/20.
//  Copyright © 2020 André Alves. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var coordinator: InitialCoordinator?
    
    private func startNavigation(_ navigation: UINavigationController) {
        coordinator = InitialCoordinator(navigation: navigation)
        coordinator?.start()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let navigationController = UINavigationController()
        
        startNavigation(navigationController)
        window = UIWindow(frame: UIScreen.main.bounds)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }


}

