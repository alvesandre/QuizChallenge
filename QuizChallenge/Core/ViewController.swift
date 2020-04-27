//
//  ViewController.swift
//  QuizChallenge
//
//  Created by André Alves on 07/03/20.
//  Copyright © 2020 André Alves. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate: class {
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

extension ViewControllerDelegate {
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisappear() {}
    func viewDidDisappear() {}
}
