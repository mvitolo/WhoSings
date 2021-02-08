//
//  API+chart.artists.getTests.swift
//  WhoSingsTests
//
//  Created by Matteo Vitolo on 08/02/2021.
//

import XCTest
@testable import WhoSings
import Nimble

class API_chart_artists_getTests: XCTestCase {
    func testParameters() {
        let sut = API.ChartArtistsGet()
        
        expect(sut.headers).to(beEmpty())
        expect(sut.path).to(equal("chart.artists.get"))
        expect(sut.queryItems).toNot(beNil())
        expect(sut.queryItems?.count).to(equal(3))

    }
}
