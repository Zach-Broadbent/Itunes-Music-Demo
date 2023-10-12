//
//  SongPersistenceManager.swift
//  AdvancedSwiftUILectures
//
//  Created by Zach Broadbent on 2/28/23.
//

import Foundation
import CoreData

class SongPersistenceManager {
    
    private var container: NSPersistentContainer
    private var context: NSManagedObjectContext
    
    static let shared = SongPersistenceManager()
    
    init() {
        container = NSPersistentContainer(name: "SavedSongsCDModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error Loading Song Stores: \(error)")
            }
        }
        
        context = container.viewContext
    }

    func save() {
        do {
            try context.save()
        } catch {
            print("Error Saving: \(error)")
        }
    }
    
    func fetchSongs() throws -> [SongEntity] {
        
        let request = SongEntity.fetchRequest()
        return try context.fetch(request)
    }
    
    func delete(_ song: SongEntity) {
        context.delete(song)
        save()
    }
    
    func addSong(_ song: Song) {
        let entity = SongEntity(context: context)
        entity.id = Int32(song.id)
        entity.title = song.title
        entity.artist = song.artist
        entity.artwork = song.artwork
        entity.preview = song.preview
        entity.duration = Int32(song.duration)
        save()
    }
    
    func addSongs(_ songs: [Song]) {
        for song in songs {
            let entity = SongEntity(context: context)
            entity.id = Int32(song.id)
            entity.title = song.title
            entity.artist = song.artist
            entity.artwork = song.artwork
            entity.preview = song.preview
            entity.duration = Int32(song.duration)
        }
        save()
    }
}
