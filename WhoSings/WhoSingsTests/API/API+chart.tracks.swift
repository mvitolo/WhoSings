//
//  API+chart.tracks.swift
//  WhoSingsTests
//
//  Created by Matteo Vitolo on 02/02/2021.
//

import XCTest
@testable import WhoSings
import Nimble

class API_chart_tracks: XCTestCase {
    func testParameters() {
        let sut = API.ChartTracksGet()
        
        expect(sut.headers).to(beEmpty())
        expect(sut.path).to(equal("chart.tracks.get"))
        expect(sut.queryItems).toNot(beNil())
        expect(sut.queryItems?.count).to(equal(4))

    }
}

