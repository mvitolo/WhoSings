//
//  Snippet.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 13/02/2021.
//

import Foundation
extension Model {
    struct Snippet: Codable {
        let snippetBody: String
       
        enum CodingKeys: String, CodingKey {
            case snippetBody = "snippet_body"
        }
    }
}
