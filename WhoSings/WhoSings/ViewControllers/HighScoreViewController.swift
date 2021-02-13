//
//  HighScoreViewController.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 12/02/2021.
//
import UIKitPlus

class HighScoreViewController: ViewController {
    
    let viewModel: HighScoresViewModel
    
    init(viewModel: HighScoresViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let titleView = UText()

    override func buildUI() {
        super.buildUI()
        body {
            titleView.text(viewModel.title)
                .font(.helveticaNeueBold, 24)
                .widthToSuperview()
                .alignment(.center)
                .topToSuperview()
            
            UList {
                UForEach(viewModel.scores) { i, score in
                    HighScoresListView(score)
                }
            }
            .top(to: titleView, 24)
            .edgesToSuperview(h: 0)
            .bottomToSuperview()
        }
    }
    
}
