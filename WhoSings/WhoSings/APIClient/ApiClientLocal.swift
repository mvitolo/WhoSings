//
//  ApiClientLocal.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 08/02/2021.
//

import Foundation

public struct ApiClientLocal: APIClient {



    public init() {}

    public func getData<API: APIType>(
        _ api: API,
        completion: @escaping (Result<Data?, APIClientError>) -> Void) {

        let data = api.dummyResponse.data(using: .utf8)
        
        completion(.success(data))
    }
    
    public func execute<API: APIType>(
        _ api: API,
        completion: @escaping (Result<API.Response, APIClientError>) -> Void
    ) where API.Response: Decodable {
        getData(api) { (result: Result<Data?, APIClientError>) in
            switch result {
            case .success(let data?):
                do {
//                    var str = String(decoding: data, as: UTF8.self)
//                    str = str
//                        .replacingOccurrences(of: "\n", with: "")
//                        .replacingOccurrences(of: "\r", with: "")
//
//                    guard let strippedData = str.data(using: .utf8) else {
//                        completion(.failure(.malformedResponse))
//                        return
//                    }

                    let o = try JSONDecoder().decode(API.Response.self, from: data)
                    completion(.success(o))
                } catch {
                    completion(.failure(.malformedResponse))
                }
            case .success(nil):
                completion(.failure(.malformedResponse))
            case .failure(let e):
                completion(.failure(e))
            }
        }
    }
}
