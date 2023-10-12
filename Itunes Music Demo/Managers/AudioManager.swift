//
//  AudioManager.swift
//  AdvancedSwiftUILectures
//
//  Created by Zach Broadbent on 2/27/23.
//

import Foundation
import AVFoundation

class AudioManager: ObservableObject {
    
    var audio: AVPlayer?
    
    func playSong(from url: URL?) {
        guard let url = url else {return}
        audio = AVPlayer(url: url)
        audio?.play()
    }
}
