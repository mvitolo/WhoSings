//
//  LyricsProvider.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 07/02/2021.
//

import Foundation
import ReactiveSwift

struct SnippetItem {
    let snippetBody: String
    let trackID: Int
}

class LyricsProvider {
    let lyrics: MutableProperty<[SnippetItem]> = MutableProperty<[SnippetItem]>([])
    let lyricsAreReady: MutableProperty<Bool> = MutableProperty<Bool>(false)
    let numberOfLyrics = 3
    
//    private let apiClient: APIClient = ApiClientLocal()
    private let apiClient: APIClient = APIClientAlamofire()
    
    init(tracks: [Int]) {
        for track in tracks {
            print("LyricsProvider: TrackID = \(track)")
            
                self.apiClient.execute(API.TrackSnippetGet(track), completion: { result in
                    switch result {
                        case .success(let s) :
                            print("LyricsProvider: success")
                            self.lyrics.value.append(
                                SnippetItem(snippetBody: s.message
                                                .body
                                                .snippet
                                                .snippetBody,
                                            trackID: track)
                                )
                        
                    default:
                        print("LyricsProvider: Something went wrong")
                        break
                    }
                    
                })
        }
    
        
        lyricsAreReady <~ lyrics.map { $0.count == self.numberOfLyrics }
    }
}
