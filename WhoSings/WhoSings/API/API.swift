//
//  API.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 01/02/2021.
//

import Foundation
import Alamofire

public protocol APIType: Hashable {
    associatedtype Response

    typealias BaseURL = URL
    typealias Headers = [String: String]
    typealias Query = [URLQueryItem]
    typealias Path = String
    typealias RequestBuilder = () -> URLRequest?


    var baseURL: BaseURL {get}
    var path: Path {get}
    var headers: Headers {get}
    var queryItems: Query? {get}
    var requestBuilder: RequestBuilder {get}
    var apikey: String { get }
}

extension APIType {
    // I know... forcing the url is bad...
    var baseURL: BaseURL { URL(string: "http://api.musixmatch.com/ws/1.1/")! }
    var headers: Headers { [:] }
    var queryItems: Query? { nil }
    var apikey : String { "6fa3c8ae1f0bd3e8bf330f4fb680367c" }
}

extension APIType {
    var requestBuilder: RequestBuilder { {
        var components = URLComponents(
            url: self.baseURL.appendingPathComponent(self.path),
            resolvingAgainstBaseURL: true)
        components?.queryItems = self.queryItems

        guard let url = components?.url else { return nil }

        var request = URLRequest(url: url)

        self.headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }

        return request
    }}
}

struct API { }
