//
//  SongSearchVM.swift
//  AdvancedSwiftUILectures
//
//  Created by Zach Broadbent on 2/27/23.
//

import Foundation

class SongSearchVM: ObservableObject {
    
    @Published var results = [Song]()
    @Published var searchText = ""
    
    func searchMusic() {
        
        Task { [weak self] in
            do {
//                let results = try await ItunesAPIHandler.fetcMusic(with: searchText)
                guard let searchText = self?.searchText
                else {return}
                
                let results = try await ItunesAPIHandler.fetcMusic(with: searchText)
                
                await MainActor.run { [weak self] in
                    self?.results = results
                }
            } catch {
                print("No Results Found \(error)")
            }
        }
        
    }
    
}
