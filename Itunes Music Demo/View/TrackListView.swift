//
//  TrackListView.swift
//  AdvancedSwiftUILectures
//
//  Created by Zach Broadbent on 2/27/23.
//

import SwiftUI

struct TrackListView: View {
    
    @StateObject var viewModel = SongSearchVM()
    @EnvironmentObject var audioManager: AudioManager
    
    var body: some View {
        NavigationView {
            List(viewModel.results) { song in
                zeroSpaceDivider
                listItem(for: song)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .environment(\.defaultMinListRowHeight, 0)
        }
        .navigationTitle("")
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .onSubmit(of: .search) {
            viewModel.searchMusic()
        }
    }
    
    var zeroSpaceDivider: some View {
        Divider()
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
    
    func listItem(for song: Song) -> some View {
        SongPreviewView(
            title: song.title,
            artist: song.artist,
            artworkURL: song.artwork,
            previewURL: song.preview
        )
        .swipeActions {
            Button {
                SongPersistenceManager.shared.addSong(song)
            } label: {
                Label("Like Song", systemImage: "heart")
                    .labelStyle(.iconOnly)
            }
            .tint(.cyan)
        }
    }
}

struct TrackListView_Previews: PreviewProvider {
    static var previews: some View {
        TrackListView()
    }
}
