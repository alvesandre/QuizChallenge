//
//  QuizViewController.swift
//  QuizChallenge
//
//  Created by André Alves on 08/03/20.
//  Copyright © 2020 André Alves. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextField: TextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var correctAnswersCounterLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var loadingView: UIView!
    
    
    var delegate: QuizViewControllerDelegate?
    
    private var correctAnswers: [String] = []
    private var answers: [String] = []
    private var timer: Timer?
    
    //TIME LIMIT in minutes
    private let TIMER_LIMIT: Int = 1
    
    func showLoading(show: Bool) {
        UIView.animate(withDuration: 0.5) {
            self.loadingView.isHidden = !show
        }
        show ? indicator.startAnimating() : indicator.stopAnimating()
    }
    
    func configureView(with content: (question: String, answers: [String])) {
        self.questionLabel.text = content.question
        self.correctAnswers = content.answers
        self.correctAnswersCounterLabel.text = "0/\(String(content.answers.count))"
        self.setCounterText(minutes: TIMER_LIMIT, seconds: 0)
        self.answerTextField.isEnabled = false
        self.setButtonText(text: "Start")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.answerTextField.delegate = self
        delegate?.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        delegate?.viewDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.viewWillDisappear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        delegate?.viewDidDisappear()
    }
    
    @IBAction func pressStart() {
        if timer != nil {
            timer?.invalidate()
        }
        self.setCounterText(minutes: TIMER_LIMIT, seconds: 0)
        self.answerTextField.isEnabled = true
        self.answerTextField.becomeFirstResponder()
        self.answers = []
        setCorrectAnswersText()
        tableView.reloadData()
        self.setButtonText(text: "Reset")
        startTimer()
    }
    
    private func startTimer() {
        var timeLimit: Int = Int(self.TIMER_LIMIT * 60)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            timeLimit -= 1
            let minutes = Int(timeLimit / 60)
            let seconds = timeLimit % 60
            if minutes == 0, seconds == 0 {
                self.timer?.invalidate()
                self.delegate?.showError(correctAnswers: self.answers.count, totalAnswers: self.correctAnswers.count)
            }
            self.setCounterText(minutes: minutes, seconds: seconds)
        })
    }
    
    private func setCounterText(minutes: Int, seconds: Int) {
        self.timerLabel.text = "\(String(minutes)):\(String(seconds).leftPadding(toLength: 2, withPad: "0"))"
    }
    
    private func setButtonText(text: String) {
        startButton.setTitle(text, for: .normal)
        startButton.setTitle(text, for: .highlighted)
    }
    
    private func setCorrectAnswersText() {
        correctAnswersCounterLabel.text = "\(String(answers.count))/\(String(correctAnswers.count))"
    }
}

// MARK:- TableViewDataSource
extension QuizViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.font = UIFont(name: "SF-Pro-Display-Regular", size: 17) ?? UIFont.systemFont(ofSize: 16)
        cell.textLabel?.text = answers[indexPath.row].capitalized
        return cell
    }
}

// MARK:- TableViewDataSource
extension QuizViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

// MARK:- TextFieldDelegate
extension QuizViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {
            return true
        }
        if let answer = correctAnswers.first(where: {$0.lowercased() == text.lowercased()}), !answers.contains(answer) {
            answers.append(answer)
            setCorrectAnswersText()
            tableView.reloadData()
        }
        
        if answers.count == correctAnswers.count {
            timer?.invalidate()
            delegate?.showSuccess()
        }
        textField.text = ""
        return true
    }
}
