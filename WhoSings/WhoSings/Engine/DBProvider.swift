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
//    private let password = Expression<String>("password")
    
    private let users = Table("users")
    
    
    init() {
        do {
            let databaseFileName = "db.sqlite3"
            let databaseFilePath = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/\(databaseFileName)"
            db = try! Connection(databaseFilePath)
            
            guard let d = db else { return }
            
            try d.run(users.create { t in
                t.column(id, primaryKey: true)
                t.column(name, unique: true)
//                t.column(password)
            })
            
        } catch {
            print("DBProvider")
        }
    }
    
    func getUserID(_ value: String) -> Int {
        guard let d = db else { return -1 }
        
        do {
         
                for loggedUser in try d.prepare(users) {
                    print("User: \(loggedUser[id]) \(loggedUser[name])")
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

        return -1
    }
    
}
