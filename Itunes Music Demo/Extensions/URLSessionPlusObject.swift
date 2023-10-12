//
//  URLSessionPlusObject.swift
//  AdvancedSwiftUILectures
//
//  Created by Zach Broadbent on 2/27/23.
//

import Foundation


extension URLSession {
    
    func object<Object: Codable>(from url: URL) async throws -> Object {
        let (data, _) = try await data(from: url)
        return try JSONDecoder().decode(Object.self, from: data)
    }
    
    func object<Object: Codable>(for request: URLRequest) async throws -> Object {
        let (data, _) = try await data(for: request)
        return try JSONDecoder().decode(Object.self, from: data)
    }
    
}
