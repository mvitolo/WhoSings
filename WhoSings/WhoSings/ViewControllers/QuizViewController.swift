//
//  QuizViewController.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 05/02/2021.
//
import UIKit
import UIKitPlus

class QuizViewController: ViewController {

    let viewModel: QuizViewModel
    
    init(viewModel: QuizViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
                    }
                } else {
                    self.body {
                        UVScrollStack {
                           UText()
                            .text("🎤")
                            .alignment(.center)
                            .widthToSuperview()

                           UText()
                            .text("Who Sings....")
                            .alignment(.center)
                            .widthToSuperview()

                           UText()
                            .text(self.viewModel.lyrics() ?? "")
                            .alignment(.center)
                            .widthToSuperview()
                         
                            UVSpace(20)
                            
                           self.viewModel.randomArtists()
                                    .map {
                                        UButton()
                                            .title($0.name)
                                    }
           
                        }
                        .widthToSuperview()
                        .topToSuperview()
                        .bottomToSuperview()
                    }
                }
            }
          
       }

    func push() {
        self.present(UIViewController(), animated: false)
    }
}
