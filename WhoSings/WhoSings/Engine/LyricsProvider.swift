//
//  LyricsProvider.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 07/02/2021.
//

import Foundation
import ReactiveSwift

class LyricsProvider {
    let lyrics: MutableProperty<[Model.Snippet]> = MutableProperty<[Model.Snippet]>([])
    let lyricsAreReady: MutableProperty<Bool> = MutableProperty<Bool>(false)
    private let lyricsID: MutableProperty<Int>
    
//    private let apiClient: APIClient = ApiClientLocal()
    private let apiClient: APIClient = APIClientAlamofire()
    
    init(track: Int) {
        print("LyricsProvider: Track = \(track)")
        lyricsID = MutableProperty<Int>(track)
        lyricsID.producer.startWithValues { value in
            self.apiClient.execute(API.TrackSnippetGet(value), completion: { result in
                switch result {
                    case .success(let s) :
                        self.lyrics.value = [s.message
                            .body
                            .snippet]
                    
                default:
                    print("LyricsProvider: Something went wrong")
                    break
                }
                
            })
        }
        
        lyricsAreReady <~ lyrics.map { $0.count > 0 }
    }
    
    func loadTrack(_ value: Int) {
        lyrics.value = []
        lyricsID.value = value
    }
}
