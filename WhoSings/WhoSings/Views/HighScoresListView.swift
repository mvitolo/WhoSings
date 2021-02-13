//
//  HighScoresListView.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 06/02/2021.
//

import UIKitPlus

class HighScoresListView: UView {
    let name: String
    let date: String
    let points: String
    
    init (_ score: Score) {
        name = score.name
        let df = DateFormatter()
        df.dateFormat = "dd MMM YYYY"
        date = df.string(from: score.date)
        points = String(score.points)
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameText = UText()
        .font(.helveticaNeueBold, 24)
        .widthToSuperview()
    
    override func buildView() {
        super.buildView()
        body {
            UHStack {
                UText(date)
                    .font(.helveticaNeueBold, 16)
                    .alignment(.left)
                UText(name)
                    .font(.helveticaNeueBold, 16)
                    .alignment(.left)
                UText(points)
                    .font(.helveticaNeueBold, 16)
                    .alignment(.right)
                
            }
            .spacing(10)
            .edgesToSuperview(h: 16, v: 0)
        }
    }
}
