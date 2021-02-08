//
//  Lyrics.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 06/02/2021.
//

import Foundation
extension Model {
    struct Lyrics: Codable {
        let lyricsID: Int
        let lyricsBody: String
       
        enum CodingKeys: String, CodingKey {
            case lyricsID = "lyrics_id"
            case lyricsBody = "lyrics_body"
        }
    }
}
