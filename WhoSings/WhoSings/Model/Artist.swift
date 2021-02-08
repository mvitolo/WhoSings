//
//  Artist.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 06/02/2021.
//

import Foundation


extension Model {
    struct ArtistContainer: Codable {
        let artist: Model.Artist
    }
    
    struct Artist: Codable {
        let artistID: Int
        let artistName: String

        enum CodingKeys: String, CodingKey {
            case artistID = "artist_id"
            case artistName = "artist_name"
        }
    }
}
