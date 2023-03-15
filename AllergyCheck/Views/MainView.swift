//
//  MainView.swift
//  AllergyCheck
//
//  Created by Ruby Feller on 07/03/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ScanView()
                .tabItem {
                    Label("Scanner", systemImage: "barcode.viewfinder")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
