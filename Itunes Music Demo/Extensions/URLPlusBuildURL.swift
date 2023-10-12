//
//  URLPlusBuildURL.swift
//  AdvancedSwiftUILectures
//
//  Created by Zach Broadbent on 2/27/23.
//

import Foundation


extension URL {
    
    static func buildURL(
        scheme: String,
        host: String,
        endpoint: String,
        parameters: [URLQueryItem]
    ) -> URL? {
    
        var componenets = URLComponents()
        componenets.scheme = scheme
        componenets.host = host
        componenets.path = endpoint
        componenets.queryItems = parameters
        
        return componenets.url
    }
    
}
