import SwiftUI

struct SettingsView: View {
    @State private var tones: [String] = ["Fun", "Romantic", "Professional"]

    var body: some View {
        List {
            ForEach($tones, id: \.self) { $tone in
                TextField("Tone Label", text: $tone)
            }
        }
        .navigationTitle("Tone Presets")
        .onAppear {
            // Load from shared UserDefaults
            let defaults = UserDefaults(suiteName: "group.com.yourname.Alkeyboard")
            if let stored = defaults?.object(forKey: "tonePresets") as? [String] {
                tones = stored
            }
        }
        .onDisappear {
            // Save updates
            let defaults = UserDefaults(suiteName: "group.com.yourname.Alkeyboard")
            defaults?.set(tones, forKey: "tonePresets")
        }
    }
}//
//  SettingsView.swift
//  AIkeyboard
//
//  Created by Raine Goh on 17/1/25.
//

