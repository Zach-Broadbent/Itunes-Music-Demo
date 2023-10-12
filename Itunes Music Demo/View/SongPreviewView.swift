//
//  SongPreviewView.swift
//  AdvancedSwiftUILectures
//
//  Created by Zach Broadbent on 2/28/23.
//

import SwiftUI

struct SongPreviewView: View {
    
    @EnvironmentObject var audioManger: AudioManager
    
    let title: String
    let artist: String
    
    let artworkURL: URL?
    let previewURL: URL?
    
    var body: some View {
        Button {
            audioManger.playSong(from: previewURL)
        } label: {
            HStack{
                artwork
                details
            }
        }
    }
    
    var details: some View {
        VStack(alignment: .leading) {
            Text(title)
                .lineLimit(1)
            Text(artist)
                .lineLimit(1)
                .foregroundColor(.secondary)
        }
    }
    
    var artwork: some View {
        AsyncImage(url: artworkURL) { phase in
            switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                default:
                    Image(systemName: "x.square.fill")
                        .resizable()
                        .foregroundColor(.red)
            }
        }
        .frame(width: 70, height: 70)
    }
}

//struct SongPreviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        SongPreviewView()
//    }
//}
