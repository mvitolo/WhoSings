//
//  API+track.snippet.get.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 13/02/2021.
//

import Foundation

extension API {
    public struct TrackSnippetGet: APIType {
        public typealias Response = Model.Container<Model.Body.SnippetContainer>
        let trackID: Int
        
        init(_ trackID: Int) {
            self.trackID = trackID
        }
        
        
        var path: Path { "track.snippet.get" }

        var queryItems: Query? {
            return [
                URLQueryItem(name: "track_id", value: "\(self.trackID)"),
                URLQueryItem(name: "apikey", value: self.apikey)

            ]
        }
        
        var dummyResponse: String = "{ \"message\": { \"header\": { \"status_code\": 200, \"execute_time\": 0.076300859451294 }, \"body\": { \"snippet\": { \"snippet_language\": \"en\", \"restricted\": 0, \"instrumental\": 0, \"snippet_body\": \"And that was when I kissed her\", \"script_tracking_url\": \"http:\\/\\/tracking.musixmatch.com\\/t1.0\\/vP\\/4tEM8IvAktR\", \"pixel_tracking_url\": \"http:\\/\\/tracking.musixmatch.com\\/t1.0\\/NFzFhcY8YtgTICf1\", \"html_tracking_url\": \"http:\\/\\/tracking.musixmatch.com\\/t1.0\\/1qIYKTNdc\", \"updated_time\": \"2012-03-12T11:56:56Z\" } } } }"
    }
}
