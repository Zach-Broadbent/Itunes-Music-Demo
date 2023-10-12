//
//  MainTabBar.swift
//  AdvancedSwiftUILectures
//
//  Created by Zach Broadbent on 2/28/23.
//

import SwiftUI

struct MainTabBar: View {
    
    @StateObject var audioManager = AudioManager()

    var body: some View {
        TabView {
            TrackListView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            LikedSongsListView()
                .tabItem {
                    Label("Liked", systemImage: "heart")
                }
            
        }
        .environmentObject(audioManager)
    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
