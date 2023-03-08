//
//  PlaySound.swift
//  AllergyCheck
//
//  Created by Dennis on 07/03/2023.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: "aif") {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Error: Could not find and play sound file!")
        }
    }
}
