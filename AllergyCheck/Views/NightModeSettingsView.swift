//
//  NightModeSettingsView.swift
//  AllergyCheck
//
//  Created by Dennis on 07/03/2023.
//

import SwiftUI

struct NightModeSettingsView: View {
    var options = ["☀️ Light", "🌙 Dark", "🌓 Automatic"]
    @State private var selectedOption = ""
    
    var body: some View {
        Form {
            Section {
                Text("Update your night mode settings")
            }
            Section {
                Picker("", selection:
                    $selectedOption) {
                    ForEach(options, id: \.self) {
                        Text($0)
                    }
                }
                    .pickerStyle(.inline)
            } header: {
                Text("Update your night mode preference")
            }
        }
        .navigationTitle("Night mode settings")
    }
}

struct NightModeSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NightModeSettingsView()
    }
}
