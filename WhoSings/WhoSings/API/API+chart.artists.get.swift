//
//  API+chart.artists.get.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 06/02/2021.
//

import Foundation

extension API {
    public struct ChartArtistsGet: APIType {
        public typealias Response = Model.Container<Model.Body.ArtistList>
        
        var path: Path { "chart.artists.get" }

        var queryItems: Query? {
            return [
                URLQueryItem(name: "page_size", value: "100"),
                URLQueryItem(name: "page", value: "1"),
                URLQueryItem(name: "apikey", value: self.apikey)

            ]
        }
    }
}
