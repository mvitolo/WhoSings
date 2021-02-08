//
//  TrackList.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 01/02/2021.
//

import Foundation
extension Model {
    struct Body {
        struct TrackList: Codable {
            let trackLists: [Model.TrackList]

            enum CodingKeys: String, CodingKey {
                case trackLists = "track_list"
            }
        }
        
        struct ArtistList: Codable {
            let artistLists: [Model.ArtistContainer]

            enum CodingKeys: String, CodingKey {
                case artistLists = "artist_list"
            }
        }
        
        struct LyricsContainer: Codable {
            let lyrics: Lyrics
        }
    }
    
    struct TrackList: Codable {
        let track: Track
    }
}
