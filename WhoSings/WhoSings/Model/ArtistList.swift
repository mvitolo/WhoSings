//
//  ArtistList.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 06/02/2021.
//

import Foundation
extension Model {
    extension Body {
        struct ArtistList: Codable {
            let artistLists: [Model.TrackList]

            enum CodingKeys: String, CodingKey {
                case trackLists = "artist_list"
            }
        }
    }
    
    struct ArtistList: Codable {
        let track: Track
    }
}
