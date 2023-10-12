//
//  LikedSongsVM.swift
//  AdvancedSwiftUILectures
//
//  Created by Zach Broadbent on 2/28/23.
//

import Foundation

class LikedSongsVM: ObservableObject {
    
    private let manager = SongPersistenceManager.shared
    
    @Published var likedSongs = [SongEntity]()
    
    func fetchLikedSongs() {
        
        do {
            self.likedSongs = try manager.fetchSongs()
        } catch {
            
            print("Error Fetching Songs: \(error)")
        }
    }
    
    func delete(_ song: SongEntity) {
        manager.delete(song)
        fetchLikedSongs()
    }
}
