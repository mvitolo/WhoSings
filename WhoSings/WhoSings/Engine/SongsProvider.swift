//
//  SongsProvider.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 06/02/2021.
//

import Foundation
import ReactiveSwift

class SongsProvider {
    let songs: MutableProperty<[Model.Track]> = MutableProperty<[Model.Track]>([])
    let songsAreReady: MutableProperty<Bool> = MutableProperty<Bool>(false)
    
    private let apiClient: APIClient = ApiClientLocal()
//    private let apiClient: APIClient = APIClientAlamofire()
    
    private let numberOfTracks = 3

    init() {
        apiClient.execute(API.ChartTracksGet(), completion: { result in
            switch result {
                case .success(let s) :
                    self.songs.value = s.message
                        .body
                        .trackLists
                        .map {
                            $0.track
                        }
            default:
                print("SongsProvider: Something went wrong")
                break
            }
            
        })
        
        songsAreReady <~ songs.map { $0.count > 0 }
    }

    func random() -> [Model.Track] {
        let r: [Model.Track] = (0..<numberOfTracks).map {_ in
            let counter = (songs.value.count - 1)
            return songs.value[Int.random(in: 0...counter)]
        }
        return r
    }
    
    
}
