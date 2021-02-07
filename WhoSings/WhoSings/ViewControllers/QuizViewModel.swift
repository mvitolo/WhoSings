//
//  QuizViewModel.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 06/02/2021.
//

import Foundation
import ReactiveSwift

class QuizViewModel {
    private let artistsProvider = ArtistProvider()
    private let lyricsProvider: LyricsProvider
    let song: Model.Track
    let isLoading = MutableProperty<Bool>(true)
    
    init(song: Model.Track) {
        self.song = song
        self.lyricsProvider = LyricsProvider(track: song.trackID)
        isLoading <~ Property.combineLatest(artistsProvider.artistsAreReady, lyricsProvider.lyricsAreReady)
            .map { artists, lyrics -> Bool in
                !(artists && lyrics)
            }
    }
    
    func lyrics() -> String? {
        lyricsProvider.lyrics.value.first?.lyricsBody
    }
    
    func randomArtists() -> [ArtistProvider.Answer] {
        artistsProvider
            .random(winner: self.song.artistID)
            .shuffled()
    }
}
