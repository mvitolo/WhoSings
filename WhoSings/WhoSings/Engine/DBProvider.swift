//
//  DBProvider.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 10/02/2021.
//

import Foundation
import SQLite

class DBProvider {
    private var db: Connection?
    
    private let id = Expression<Int64>("id")
    private let name = Expression<String?>("name")
    private let date = Expression<Date>("date")
    private let score = Expression<Int64>("score")
    private let userid = Expression<Int64>("userid")

//    private let password = Expression<String>("password")
    
    private let users = Table("users")
    private let scores = Table("scores")

    
    init() {
        do {
            let databaseFileName = "db.sqlite3"
            let databaseFilePath = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/\(databaseFileName)"
            db = try! Connection(databaseFilePath)
            
            guard let d = db else { return }
            
            try d.run(scores.create { t in
                t.column(id, primaryKey: true)
                t.column(userid)
                t.column(name)
                t.column(date)
                t.column(score)
//                t.column(password)
            })
            
            try d.run(users.create { t in
                t.column(id, primaryKey: true)
                t.column(name, unique: true)
//                t.column(password)
            })
            
        } catch {
        }
    }
    
    func getUserID(_ value: String) -> Int {
        guard let d = db else { return -1 }
        
        do {
            for loggedUser in try d.prepare(users) {
                print("User: \(loggedUser[id]) \(loggedUser[name] ?? "")")
                if loggedUser[name] == value {
                    return Int(loggedUser[id])
                }
            }
            
            let insert = users.insert(name <- value)
            let rowid = try d.run(insert)

            return Int(rowid)
        } catch {
            return -1
        }
    }
    
    func hitScore(userID: Int, userName: String, points: Int) {
        guard let d = db else { return }
        
        do {
            /*
             t.column(userid)
             t.column(name)
             t.column(date)
             t.column(score)
             */
            
            let insert = scores.insert(userid <- Int64(userID),
                                      name <- userName,
                                      date <- Date(),
                                      score <- Int64(points))
            try d.run(insert)

        } catch {
            return
        }
    }
    
    func getScores() -> [Score] {
        guard let d = db else { return [] }
        
        do {
            var values = [Score]()
            for s in try d.prepare(scores) {
                let e = Score(name: s[name] ?? "" ,
                              id: Int(s[userid]),
                              points: Int(s[score]),
                              date: s[date])
                values.append(e)
            }
            return values
        } catch {
            return []
        }
    }
}
