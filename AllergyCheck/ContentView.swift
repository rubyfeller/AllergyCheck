//
//  ContentView.swift
//  AllergyCheck
//
//  Created by Ruby Feller on 01/03/2023.
//

import SwiftUI

extension Color {
    static let primary = Color("Primary")
    static let secondary = Color("Secondary")
}

struct ContentView: View {
    @State private var showAllergySelectionView = false

    var body: some View {
        VStack {
            Image(systemName: "checkmark.square").font(.system(size: 80))
                .foregroundColor(.green)
                .padding()
                .font(.largeTitle)
            Text("AllergyCheck")
                .font(.largeTitle)
            Text("Your (shop) buddy for allergens")
            Button("Start") {
                showAllergySelectionView = true
            }.sheet(isPresented: $showAllergySelectionView) {
                AllergySelectionView()
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("Secondary"))
            .controlSize(.large)
            .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .background(Color("Primary"))
        .foregroundStyle(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
