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

    override func buildUI() {
           super.buildUI()
           view.backgroundColor = .white

            viewModel.isLoading
                .producer
                .startWithValues { isLoading in
                    if (isLoading) {
                        self.body {
                            UHUD()
                                .mode(.activityIndicator)
                                .indicatorColor(.darkGray)
                                .centerXInSuperview()
                                .centerYInSuperview()
                        }
                    } else {
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
        let vm = QuizViewModel(song: viewModel.random())
        let qvc = QuizViewController(viewModel: vm)

        self.navigationController?.pushViewController(qvc, animated: true)
    }
}

