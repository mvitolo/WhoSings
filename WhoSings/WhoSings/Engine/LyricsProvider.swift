//
//  LyricsProvider.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 07/02/2021.
//

import Foundation
import ReactiveSwift

class LyricsProvider {
    let lyrics: MutableProperty<[Model.Lyrics]> = MutableProperty<[Model.Lyrics]>([])
    let lyricsAreReady: MutableProperty<Bool> = MutableProperty<Bool>(false)
    
    init(track: Int) {
        APIClientAlamofire().execute(API.TrackLyricsGet(track), completion: { result in
            switch result {
                case .success(let s) :
                    self.lyrics.value = [s.message
                        .body
                        .lyrics]
                
            default:
                print("LyricsProvider: Something went wrong")
                break
            }
            
        })
        
        lyricsAreReady <~ lyrics.map { $0.count > 0 }
    }
}
