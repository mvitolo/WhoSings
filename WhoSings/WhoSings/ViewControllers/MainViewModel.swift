//
//  MainViewModel.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 06/02/2021.
//

import Foundation
import ReactiveSwift

class MainViewModel {
    private let songProvider = SongsProvider()
    let isLoading = MutableProperty<Bool>(true)
    
    init() {
        isLoading <~ songProvider.songsAreReady.map { !$0 }
    }
    
    func random() -> Model.Track {
        songProvider.random()
    }
}
