//
//  AllergyCheckApp.swift
//  AllergyCheck
//
//  Created by Ruby Feller on 01/03/2023.
//

import SwiftUI

let onboarding = UserDefaults.standard

@main
struct AllergyCheckApp: App {
    var body: some Scene {
        WindowGroup {
            if (onboarding.bool(forKey: "Onboarding") == false) {
                ContentView()
            }
            else {
                MainView()
            }

        }
    }
}
