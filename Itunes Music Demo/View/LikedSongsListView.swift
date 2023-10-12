//
//  LikedSongsListView.swift
//  AdvancedSwiftUILectures
//
//  Created by Zach Broadbent on 2/28/23.
//

import SwiftUI

struct LikedSongsListView: View {
    
    @StateObject var viewModel = LikedSongsVM()
    
    var body: some View {
        List(viewModel.likedSongs) { song in
            zeroSpaceDivider
            songPreview(for: song)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .environment(\.defaultMinListRowHeight, 0)
        .onAppear {
            viewModel.fetchLikedSongs()
        }
    }
    
    var zeroSpaceDivider: some View {
        Divider()
            .listRowInsets(.init(.zero))
    }
    
    func songPreview(for song: SongEntity) -> some View {
        SongPreviewView(
            title: song.title ?? "Unknown",
            artist: song.artist ?? "Unknown",
            artworkURL: song.artwork,
            previewURL: song.preview
        )
        .swipeActions {
            Button {
                viewModel.delete(song)
            } label: {
                Label("Remove Song", systemImage: "heart.slash.fill")
                    .labelStyle(.iconOnly)
            }
            .tint(.red)
        }
    }
}

struct LikedSongsListView_Previews: PreviewProvider {
    static var previews: some View {
        LikedSongsListView()
    }
}
