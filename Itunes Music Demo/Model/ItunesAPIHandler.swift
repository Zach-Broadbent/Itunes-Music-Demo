//
//  ItunesAPIHandler.swift
//  AdvancedSwiftUILectures
//
//  Created by Zach Broadbent on 2/27/23.
//

import Foundation


struct ItunesAPIHandler {
    
    static let host = "itunes.apple.com"
    static let scheme = "https"
    
    enum ItunesAPIError: Error {
        case invalidURL
    }
    
    struct ResultWrapper<Object: Codable>: Codable {
        let results: [Object]
    }
    
    static func fetcMusic(with searchTerm: String) async throws -> [Song] {
        
        let cleanedSpaces = searchTerm.replacing(" ", with: "+")
        
        guard let searchText = cleanedSpaces.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
             // let url = URL(string: "https://itunes.apple.com/search?media=music&term=\(searchText)")
              let url = URL.buildURL(
                scheme: scheme,
                host: host,
                endpoint: "/search",
                parameters: [
                    URLQueryItem(name: "term", value: searchText),
                    URLQueryItem(name: "media", value: "music")
                ]
              )
        else { throw ItunesAPIError.invalidURL }
        
//        let (data, _) = try await URLSession.shared.data(from: url)
//        let result = try JSONDecoder().decode(ResultWrapper<Song>.self, from: data)
//
//        return result.results
        let result: ResultWrapper<Song> = try await URLSession.shared.object(from: url)
        return result.results
    }
    
}
