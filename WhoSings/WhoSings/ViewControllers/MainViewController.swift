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
                        UVStack {
                            UText()
                                .text(self.viewModel.$welcome)
                                .font(.helveticaNeueBold, 24)
                            UButton()
                                .title("Let's start! 🎤")
                                .color(.black)
                                .topToSuperview(44, safeArea: true)
                                .onTapGesture {
                                    self.push()
                                }
                        }
                        .centerXInSuperview()
                        .centerYInSuperview()
                        
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
    
    func push() {
        let vm = QuizViewModel(songs: viewModel.random())
        let qvc = QuizViewController(viewModel: vm)
        
        self.navigationController?.pushViewController(qvc, animated: true)
    }
}

