//
//  API+chart.tracks.get.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 01/02/2021.
//

import Foundation

extension API {
    public struct ChartTracksGet: APIType {
        public typealias Response = Model.Container<Model.Body.TrackList>
        
        var path: Path { "chart.tracks.get" }

        var queryItems: Query? {
            return [
                URLQueryItem(name: "page_size", value: "100"),
                URLQueryItem(name: "page", value: "1"),
                URLQueryItem(name: "f_has_lyrics", value: "1"),
                URLQueryItem(name: "s_track_rating", value: "desc"),
                URLQueryItem(name: "apikey", value: self.apikey)

            ]
        }
    }
}
