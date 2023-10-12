//
//  Song.swift
//  AdvancedSwiftUILectures
//
//  Created by Zach Broadbent on 2/27/23.
//

import Foundation


struct Song: Codable, Identifiable {
    let id: Int
    let title: String
    let artist: String
    let artwork: URL
    let preview: URL?
    let duration: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case title = "trackName"
        case artist = "artistName"
        case artwork = "artworkUrl100"
        case preview = "previewUrl"
        case duration = "trackTimeMillis"
    }
}
