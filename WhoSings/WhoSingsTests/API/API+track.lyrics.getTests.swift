//
//  API+track.lyrics.getTests.swift
//  WhoSingsTests
//
//  Created by Matteo Vitolo on 08/02/2021.
//

import XCTest
@testable import WhoSings
import Nimble

class API_tracks_lyrics_getTests: XCTestCase {
    func testParameters() {
        let sut = API.TrackLyricsGet(12345)
        
        expect(sut.headers).to(beEmpty())
        expect(sut.path).to(equal("track.lyrics.get"))
        expect(sut.queryItems).toNot(beNil())
        expect(sut.queryItems?.count).to(equal(2))

    }
}
