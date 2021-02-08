//
//  ApiClientAlamoFire.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 01/02/2021.
//

import Foundation
import Alamofire
import ReactiveSwift

public enum APIClientError: Error {
    case malformedRequest
    case malformedResponse
    case generic
}

public protocol APIClient {
    func getData<API: APIType>(_ api: API, completion: @escaping (Result<Data?, APIClientError>) -> Void)
    func execute<API: APIType>(
        _ api: API,
        completion: @escaping (Result<API.Response, APIClientError>) -> Void)  where API.Response: Decodable
}

public struct APIClientAlamofire: APIClient {


    private static let manager: Alamofire.Session = Alamofire.Session()

    public init() {}

    public func getData<API: APIType>(
        _ api: API,
        completion: @escaping (Result<Data?, APIClientError>) -> Void) {
        guard let request = api.requestBuilder() else {
            return
        }

        let alamoRequest = Self.manager.request(request)
        alamoRequest.response { r in
            guard let result = r.data else {
                completion(.failure(.malformedResponse))
                return
            }

            DispatchQueue.main.async {
                completion(.success(result))
            }
        }
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
