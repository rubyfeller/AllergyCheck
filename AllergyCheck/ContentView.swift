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

    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "checkmark.square").font(.system(size: 80))
                    .foregroundColor(.green)
                    .padding()
                    .font(.largeTitle)
                Text("AllergyCheck")
                    .font(.largeTitle)
                Text("Your (shop) buddy for allergens")
                NavigationLink(destination: AllergySelectionView()) {
                    Text("Start")
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
