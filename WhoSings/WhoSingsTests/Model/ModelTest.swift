//
//  APIClientAlamofireTests.swift
//  WhoSingsTests
//
//  Created by Matteo Vitolo on 02/02/2021.
//

import XCTest
import Nimble
import Mockingjay
@testable import WhoSings

class ModelTest: XCTestCase {
    let rawTracks = "{\"message\":{\"header\":{\"status_code\":200,\"execute_time\":0.01530385017395},\"body\":{\"track_list\":[{\"track\":{\"track_id\":201234497,\"track_name\":\"WAP (feat. Megan Thee Stallion)\",\"track_name_translation_list\":[],\"track_rating\":99,\"commontrack_id\":114611205,\"instrumental\":0,\"explicit\":1,\"has_lyrics\":1,\"has_subtitles\":1,\"has_richsync\":1,\"num_favourite\":1483,\"album_id\":39576526,\"album_name\":\"WAP (feat. Megan Thee Stallion)\",\"artist_id\":46196205,\"artist_name\":\"Cardi B feat. Megan Thee Stallion\",\"track_share_url\":\"https:\\/\\/www.musixmatch.com\\/lyrics\\/Cardi-B-Megan-Thee-Stallion\\/WAP-Megan-Thee-Stallion?utm_source=application&utm_campaign=api&utm_medium=-%3A1409621032883\",\"track_edit_url\":\"https:\\/\\/www.musixmatch.com\\/lyrics\\/Cardi-B-Megan-Thee-Stallion\\/WAP-Megan-Thee-Stallion\\/edit?utm_source=application&utm_campaign=api&utm_medium=-%3A1409621032883\",\"restricted\":0,\"updated_time\":\"2020-10-10T10:41:53Z\",\"primary_genres\":{\"music_genre_list\":[{\"music_genre\":{\"music_genre_id\":34,\"music_genre_parent_id\":0,\"music_genre_name\":\"Music\",\"music_genre_name_extended\":\"Music\",\"music_genre_vanity\":\"Music\"}}]}}},{\"track\":{\"track_id\":201621042,\"track_name\":\"Dynamite\",\"track_name_translation_list\":[],\"track_rating\":99,\"commontrack_id\":114947355,\"instrumental\":0,\"explicit\":0,\"has_lyrics\":1,\"has_subtitles\":1,\"has_richsync\":1,\"num_favourite\":4839,\"album_id\":39721115,\"album_name\":\"Dynamite - Single\",\"artist_id\":24410130,\"artist_name\":\"BTS\",\"track_share_url\":\"https:\\/\\/www.musixmatch.com\\/lyrics\\/BTS\\/Dynamite?utm_source=application&utm_campaign=api&utm_medium=-%3A1409621032883\",\"track_edit_url\":\"https:\\/\\/www.musixmatch.com\\/lyrics\\/BTS\\/Dynamite\\/edit?utm_source=application&utm_campaign=api&utm_medium=-%3A1409621032883\",\"restricted\":0,\"updated_time\":\"2021-01-15T16:40:48Z\",\"primary_genres\":{\"music_genre_list\":[{\"music_genre\":{\"music_genre_id\":14,\"music_genre_parent_id\":34,\"music_genre_name\":\"Pop\",\"music_genre_name_extended\":\"Pop\",\"music_genre_vanity\":\"Pop\"}}]}}}]}}}"

    let rawArtists = "{\"message\":{\"header\":{\"status_code\":200,\"execute_time\":0.014148950576782},\"body\":{\"artist_list\":[{\"artist\":{\"artist_id\":28877462,\"artist_name\":\"Irama\",\"artist_name_translation_list\":[],\"artist_comment\":\"\",\"artist_country\":\"\",\"artist_alias_list\":[],\"artist_rating\":76,\"artist_twitter_url\":\"\",\"artist_credits\":{\"artist_list\":[]},\"restricted\":0,\"updated_time\":\"2015-11-30T13:35:12Z\",\"begin_date\":\"0000-00-00\",\"end_date\":\"0000-00-00\"}},{\"artist\":{\"artist_id\":13937035,\"artist_name\":\"The Weeknd\",\"artist_name_translation_list\":[{\"artist_name_translation\":{\"language\":\"JA\",\"translation\":\"\"}}],\"artist_comment\":\"\",\"artist_country\":\"CA\",\"artist_alias_list\":[{\"artist_alias\":\"\"},{\"artist_alias\":\"The Weekend\"}],\"artist_rating\":92,\"artist_twitter_url\":\"https:\\/\\/twitter.com\\/theweekndxo\",\"artist_credits\":{\"artist_list\":[]},\"restricted\":0,\"updated_time\":\"2017-01-28T07:00:26Z\",\"begin_date\":\"1990-02-16\",\"end_date\":\"0000-00-00\"}},{\"artist\":{\"artist_id\":28164290,\"artist_name\":\"Pinguini Tattici Nucleari\",\"artist_name_translation_list\":[],\"artist_comment\":\"\",\"artist_country\":\"\",\"artist_alias_list\":[],\"artist_rating\":78,\"artist_twitter_url\":\"\",\"artist_credits\":{\"artist_list\":[]},\"restricted\":0,\"updated_time\":\"2014-11-22T18:26:08Z\",\"begin_date\":\"0000-00-00\",\"end_date\":\"0000-00-00\"}}]}}}"
    
    let rawLyrics = "{ \"message\": { \"header\": { \"status_code\": 200, \"execute_time\": 0.04367995262146 }, \"body\": { \"lyrics\": { \"lyrics_id\": 7260188, \"lyrics_body\": \"Now and then I think of when we were together...\" } } } }"

    
    func testModelTracks() {
        let data = rawTracks.data(using: .utf8)!
        let o = try! JSONDecoder().decode(Model.Container<Model.Body.TrackList>.self, from: data)
        
        expect(o).toNot(beNil())
    }
    
    func testModelArtists() {
        let data = rawArtists.data(using: .utf8)!
        let o = try! JSONDecoder().decode(Model.Container<Model.Body.ArtistList>.self, from: data)
        
        expect(o).toNot(beNil())
    }

    func testModelLyrics() {
        let data = rawLyrics.data(using: .utf8)!
        let o = try! JSONDecoder().decode(Model.Container<Model.Body.LyricsContainer>.self, from: data)

        
        
        expect(o).toNot(beNil())
    }
}
