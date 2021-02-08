//
//  Track.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 01/02/2021.
//

import Foundation
extension Model {
    struct Track: Codable {
        let trackID: Int
        let trackName: String
        let albumID: Int
        let albumName: String
        let artistID: Int
        let artistName: String

        enum CodingKeys: String, CodingKey {
            case trackID = "track_id"
            case trackName = "track_name"
            case albumID = "album_id"
            case albumName = "album_name"
            case artistID = "artist_id"
            case artistName = "artist_name"
        }
    }
}
