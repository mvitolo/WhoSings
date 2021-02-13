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
    
    var spinner = UIActivityIndicatorView(style: .medium)
    var internalSpinner = UIActivityIndicatorView(style: .medium)

    let notification: UText = {
        let n = UText()
            .alignment(.center)
            .font(.helveticaNeueMedium, 80)
            .centerXInSuperview()
        
        return n
    }()
    
    let lyrics: UText = {
        let n = UText()
            .font(.helveticaNeueRegular, 24)
            .alignment(.center)
            .widthToSuperview()
        
        return n
    }()
    
    let score: UText = {
        let n = UText()
            .font(.helveticaNeueBold, 30)
            .adjustsFontSizeToFitWidth(true)
            .alignment(.center)
            .widthToSuperview()
            .centerXInSuperview()
        return n
    }()
    
    let answer1 = UButton()
    let answer2 = UButton()
    let answer3 = UButton()
    
    override func buildUI() {
        super.buildUI()
        view.backgroundColor = .white
                
//        viewModel.isLoading.producer
//            .skipRepeats()
//            .startWithValues { isLoading in
//                if isLoading {
//                    self.loadingBody()
//                } else {
                    self.loadedBody()
//                }
//            }
    }
    
    private func loadingBody() {
        
    }
    
    private func loadedBody() {
        self.body {
            UVScrollStack {
                UVSpace(20)
                
                self.notification.text(self.viewModel.$notification)
                
                UText()
                    .text("Who Sings....")
                    .font(.helveticaNeueBold, 30)
                    .adjustsFontSizeToFitWidth(true)
                    .alignment(.center)
                    .widthToSuperview()
                
                UVSpace(30)
                
                UVStack {
                    UVSpace(16)
                    
                    lyrics
                        .text(self.viewModel.$lyrics)
                        .lines(2)
                        .widthToSuperview()
                    
                    UVSpace(15)
                }
                .widthToSuperview()
                .border(1, .darkGray)
                
                UVSpace(30)
                
                answer1
                    .title(self.viewModel.$answer1)
                    .onTapGesture {
                        self.viewModel.moveToNextQuiz(0)
                    }
                answer2
                    .title(self.viewModel.$answer2)
                    .onTapGesture {
                        self.viewModel.moveToNextQuiz(1)
                    }
                answer3
                    .title(self.viewModel.$answer3)
                    .onTapGesture {
                        self.viewModel.moveToNextQuiz(2)
                    }
                
                UVSpace(30)
                
                UText()
                    .text("Score")
                    .font(.helveticaNeueBold, 30)
                    .adjustsFontSizeToFitWidth(true)
                    .alignment(.center)
                    .widthToSuperview()
                score
                    .text(self.viewModel.$points)

            }
            .topToSuperview()
            .bottomToSuperview()
            .centerXInSuperview()
            .edgesToSuperview(leading: 16, trailing: -16)
            
        }
    }

    func push() {
        self.present(UIViewController(), animated: false)
    }
}
