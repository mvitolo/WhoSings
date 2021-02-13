//
//  QuizViewModel.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 06/02/2021.
//

import Foundation
import ReactiveSwift
import UIKitPlus

class QuizViewModel {
    private let artistsProvider = ArtistProvider()
    private let lyricsProvider: LyricsProvider
    private let dbProvider: DBProvider

    let songs: [Model.Track]
    let isLoading = MutableProperty<Bool>(true)
    let lyricsAreReady = MutableProperty<Bool>(false)
    var currentSongIdx = 0
    var currentSong: Model.Track?
    
    @UState var lyrics = ""
    @UState var notification = "🎤"
    
    @UState var answer1: String = ""
    @UState var answer2: String = ""
    @UState var answer3: String = ""
    
    @UState var points: String = "0"
    @UState var border: Int = 1

    
    private var artists = MutableProperty<[ArtistProvider.Answer]>([])

    init(songs: [Model.Track], dbProvider: DBProvider) {
        self.dbProvider = dbProvider
        self.songs = songs
        self.currentSong = songs[currentSongIdx]
        self.lyricsProvider = LyricsProvider(track: currentSong?.artistID ?? 0)
        self.lyricsAreReady <~ lyricsProvider.lyricsAreReady
        isLoading <~ Property.combineLatest(artistsProvider.artistsAreReady, lyricsProvider.lyricsAreReady)
            .map { artists, lyrics -> Bool in
                !(artists && lyrics)
            }
        
        lyricsProvider.lyrics.producer.startWithValues{ value in
            self.lyrics = value.first?.lyricsBody ?? ""
            self.artists.value = self.randomArtists()
        }
        
        artists.producer.startWithValues { values in
            self.answer1 = values[0].name
            self.answer2 = values[1].name
            self.answer3 = values[2].name
        }
    }
    

    
    private func randomArtists() -> [ArtistProvider.Answer] {
        guard let artistID = self.currentSong?.artistID else { return [] }
        return artistsProvider
                .random(winner: artistID)
                .shuffled()
    }
    
    func moveToNextQuiz(_ answer: Int) {
        
        if currentSongIdx == songs.count - 1 {
            let id = UserDefaults.standard.integer(forKey: "Id")
            let name = UserDefaults.standard.string(forKey: "Name") ?? ""
            dbProvider.hitScore(userID: id, userName: name, points: Int(points) ?? 0)
            
            answer1 = ""
            answer2 = ""
            answer3 = ""
            lyrics = "-"
            border = 0
            return
        }
        
        notification = artists.value[answer].right ? "👍🏻" : "👎🏻"
        if artists.value[answer].right {
            let p = (Int(points) ?? 0) + 1
            points = String(p)
        }
        
        currentSongIdx = currentSongIdx + 1
        self.currentSong = songs[currentSongIdx]
        lyricsProvider.loadTrack(self.currentSong?.trackID ?? 0)
    }
}
