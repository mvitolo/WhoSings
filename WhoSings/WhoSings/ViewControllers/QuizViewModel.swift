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
    let songs: [Model.Track]
    let isLoading = MutableProperty<Bool>(true)
    var currentSongIdx = 0
    var currentSong: Model.Track?
    
    init(songs: [Model.Track]) {
        self.songs = songs
        self.currentSong = songs[currentSongIdx]
        self.lyricsProvider = LyricsProvider(track: currentSong?.artistID ?? 0)
        isLoading <~ Property.combineLatest(artistsProvider.artistsAreReady, lyricsProvider.lyricsAreReady)
            .map { artists, lyrics -> Bool in
                !(artists && lyrics)
            }
    }
    
    func lyrics() -> String? {
        lyricsProvider.lyrics.value.first?.lyricsBody
    }
    
    func randomArtists() -> [ArtistProvider.Answer] {
        guard let artistID = self.currentSong?.artistID else { return [] }
        return artistsProvider
                .random(winner: artistID)
                .shuffled()
    }
}
