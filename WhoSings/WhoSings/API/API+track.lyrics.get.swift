//
//  API+track.lyrics.get.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 07/02/2021.
//

import Foundation

extension API {
    public struct TrackLyricsGet: APIType {
        public typealias Response = Model.Container<Model.Body.LyricsContainer>
        let trackID: Int
        
        init(_ trackID: Int) {
            self.trackID = trackID
        }
        
        
        var path: Path { "track.lyrics.get" }

        var queryItems: Query? {
            return [
                URLQueryItem(name: "track_id", value: "\(self.trackID)"),
                URLQueryItem(name: "apikey", value: self.apikey)

            ]
        }
    }
}
