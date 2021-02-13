//
//  ViewController.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 01/02/2021.
//

import UIKit
import UIKitPlus
import Alertift

class MainViewController: ViewController {
    
    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var spinner = UIActivityIndicatorView(style: .medium)
    
    private let welcome = UText()
    private let start = UButton()
    private let personal = UButton()
    
    override func buildUI() {
        super.buildUI()
        view.backgroundColor = .white
        if viewModel.isLoggedIn == false {
            shotAlertForUser()
        }
        
        viewModel.isLoading
            .producer
            .startWithValues { isLoading in
                if (isLoading) {
                    self.spinner.startAnimating()
                    self.body {
                        UWrapperView(self.spinner)
                            .widthToSuperview()
                            .heightToSuperview()
                            .centerXInSuperview()
                            .centerYInSuperview()
                    }
                } else {
                    self.spinner.stopAnimating()
                    self.body {
                        self.welcome
                            .text(self.viewModel.$welcome)
                            .font(.helveticaNeueBold, 24)
                            .topToSuperview(44,safeArea: true)
                            .alignment(.center)
                            .centerXInSuperview()
                        self.start
                            .title("Let's start! 🎤")
                            .color(.black)
                            .top(to:self.welcome, 20)
                            .onTapGesture {
                                self.pushQuiz()
                            }
                            .alignment(.center)
                            .centerXInSuperview()

                        self.personal
                            .title("Your Scores 🏆")
                            .color(.black)
                            .onTapGesture {
                                self.pushPersonalScore()
                            }
                            .top(to:self.start, 20)
                            .alignment(.center)
                            .centerXInSuperview()


                            
                        
                        UButton(self.viewModel.$loginText)
                            .alignment(.center)
                            .widthToSuperview()
                            .bottomToSuperview(-20, safeArea: true)
                            .onTapGesture {
                                if self.viewModel.isLoggedIn {
                                    self.viewModel.logout()
                                } else {
                                    self.shotAlertForUser()
                                }
                            }
                    }
                }
            }
    }
    
    func shotAlertForUser() {
        DispatchQueue.main.async {
            Alertift.alert(title: "Sign in", message: "Please insert your nickname")
                .textField { textField in
                    textField.placeholder = "NickName"
                }
                .action(.default("Sign in")) { _, _, textFields in
                    let id = textFields?.first?.text ?? ""
                    self.viewModel.login(id)
                    
                }
                .show()
        }
    }
    
    func pushQuiz() {
        let vm = QuizViewModel(songs: viewModel.random(), dbProvider: viewModel.dbProvider)
        let qvc = QuizViewController(viewModel: vm)
        
        self.navigationController?.pushViewController(qvc, animated: true)
    }
    
    func pushPersonalScore() {
        let uid = UserDefaults.standard.integer(forKey: "Id")

        let vm = HighScoresViewModel(uid, dbProvider: viewModel.dbProvider)
        let qvc = HighScoreViewController(viewModel: vm)
        
        self.navigationController?.pushViewController(qvc, animated: true)
    }
}

