//
//  QuizViewController.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 05/02/2021.
//
import UIKit
import UIKitPlus
import NotificationBannerSwift

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
                            UVSpace(20)
                            UText()
                                .text("🎤")
                                .font(.helveticaNeueBold, 80)
                                .alignment(.center)
                                .widthToSuperview()
                            
                            UText()
                                .text("Who Sings....")
                                .font(.helveticaNeueBold, 30)
                                .adjustsFontSizeToFitWidth(true)
                                .alignment(.center)
                                .widthToSuperview()
                            
                            UVSpace(30)
                            
                            UVStack {
                                UVSpace(16)

                                UText()
                                    .text(self.viewModel.lyrics() ?? "")
                                    .font(.helveticaNeueRegular, 24)
                                    .lines(2)
                                    .alignment(.center)
                                    .widthToSuperview()
                                
                                UVSpace(15)
                            }
                            .widthToSuperview()
                            .border(1, .darkGray)
                            
                            UVSpace(30)
                            
                            self.viewModel.randomArtists()
                                .map { answer in
                                    UButton()
                                        .title(answer.name)
                                        .onTapGesture { 
                                            let banner = NotificationBanner(
                                                title: "Who Sings",
                                                subtitle: answer.right ? "Right" : "Wrong",
                                                style: answer.right ? .success : .warning)
                                            banner.show()
                                        }
                                }
                            
                        }
                        .topToSuperview()
                        .bottomToSuperview()
                        .centerXInSuperview()
                        .edgesToSuperview(leading: 16, trailing: -16)

                    }
                }
            }
          
       }

    func push() {
        self.present(UIViewController(), animated: false)
    }
}
