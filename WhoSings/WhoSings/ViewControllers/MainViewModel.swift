//
//  MainViewModel.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 06/02/2021.
//

import Foundation
import ReactiveSwift
import UIKitPlus

class MainViewModel {
    private let songProvider = SongsProvider()
    private let dbProvider = DBProvider()
    let isLoading = MutableProperty<Bool>(true)
    var isLoggedIn = false
    @UState var welcome: String = "Welcome, Stranger..."
    @UState var loginText: String = "Please, login"
    
    init() {
        isLoading <~ songProvider.songsAreReady.map { !$0 }
        
        let id = UserDefaults.standard.integer(forKey: "Id")
        let name = UserDefaults.standard.string(forKey: "Name")
        
        if id != 0, let n = name {
            loginText = "Logout"
            welcome = "Howdy, \(n)!"
            isLoggedIn = true
        }

    }
    
    func random() -> [Model.Track] {
        songProvider.random()
    }
    
    func login(_ name: String) {
        if name.count == 0 {
            return
        }
        let result = dbProvider.getUserID(name)
        if result > -1 {
            UserDefaults.standard.set(result, forKey: "Id")
            UserDefaults.standard.set(name, forKey: "Name")
            
            loginText = "Logout"
            welcome = "Howdy, \(name)!"
            isLoggedIn = true
        }

        print(result)
    }
    
    func logout() {
        UserDefaults.standard.set(nil, forKey: "Id")
        UserDefaults.standard.set(nil, forKey: "Name")
        
        welcome = "Welcome, Stranger..."
        loginText = "Please, Login"
        isLoggedIn = false
    }
    
}
