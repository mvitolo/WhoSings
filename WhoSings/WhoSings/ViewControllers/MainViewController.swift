//
//  ViewController.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 01/02/2021.
//

import UIKit
import UIKitPlus

class MainViewController: ViewController {
    
    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var spinner = UIActivityIndicatorView(style: .medium)

    override func buildUI() {
           super.buildUI()
           view.backgroundColor = .white

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
                               UButton()
                                .title("Let's start! 🎤")
                                .color(.black)
                                .topToSuperview(44, safeArea: true)
                                .centerXInSuperview()
                                .centerYInSuperview()
                                .onTapGesture {
                                    self.push()
                                }
                           }
                    }
            }

       }

    func push() {
        let vm = QuizViewModel(songs: viewModel.random())
        let qvc = QuizViewController(viewModel: vm)

        self.navigationController?.pushViewController(qvc, animated: true)
    }
}

