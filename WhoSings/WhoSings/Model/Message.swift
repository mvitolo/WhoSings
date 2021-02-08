//
//  Message.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 01/02/2021.
//

import Foundation

extension Model {
    public struct Container<Item: Codable>: Codable {
        public let message: Message<Item>
    }
    
    public struct Message<Item: Codable>: Codable {
        public let header: Header
        public let body: Item
    }
    
    public struct Header: Codable {
        public let statusCode: Int
        enum CodingKeys: String, CodingKey {
            case statusCode = "status_code"
        }
    }
}
