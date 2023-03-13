//
//  SettingsView.swift
//  AllergyCheck
//
//  Created by Dennis on 07/03/2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
            Form {
                Section {
                    NavigationLink {
                        NightModeSettingsView()
                    } label: {
                        Text("🌙 Night mode Settings")
                    }
                } header: {
                    Text("General settings")
                }
                Section {
                    NavigationLink {
                        AllergySettingsView()
                    } label: {
                        Text("🥜 Allergy Settings")
                    }
                } header: {
                    Text("Allergy settings")
                }
            }
            .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
