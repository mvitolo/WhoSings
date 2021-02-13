//
//  HighScoresViewModel.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 12/02/2021.
//

import Foundation
import UIKitPlus

class HighScoresViewModel {
    private let userID: Int?
    private let dbProvider: DBProvider
    var scores: [Score] = []
    var title:String
    
    init(_ userID: Int?, dbProvider: DBProvider ) {
        self.userID = userID
        self.dbProvider = dbProvider
        if self.userID != nil {
            let name = UserDefaults.standard.string(forKey: "Name") ?? "User"
            title = "\(name)'s Scores"
        } else {
            title = "HighScores"
        }
        
        reloadUserScores()
    }
    
    func reloadUserScores() {
        scores.removeAll()
        
        guard let uID = userID else {
            scores = dbProvider.getScores()
                .sorted {
                    $0.points > $1.points
                }
            return
        }

        scores.removeAll()
        scores = dbProvider.getScores()
            .filter {
                $0.id == uID
            }
            .sorted {
                $0.points > $1.points
            }
    }
}
