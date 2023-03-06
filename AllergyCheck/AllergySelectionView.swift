//
//  AllergySelectionView.swift
//  AllergyCheck
//
//  Created by Ruby Feller on 06/03/2023.
//

import SwiftUI

struct AllergySelectionView: View {
    
    struct Allergy: Codable {
        var name: String
        var icon: String
    }
    
    private let range: ClosedRange<Int> = 0...8
    @State private var selectedItems: [Int] = []
    
    var body: some View {
        TabView {

            VStack {
                Text("Choose your allergies")
                    .foregroundColor(.white)
                    .padding(50)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(range, id: \.self) { index in
                        VStack {
                            Button("🥜") {
                                if let selectedItemIndex = self.selectedItems.firstIndex(of: index) {
                                    selectedItems.remove(at: selectedItemIndex)
                                    print("removed \(index)")
                                } else {
                                    self.selectedItems.append(index)
                                    print("added \(index)")
                                    print(selectedItems)
                                }
                            }
                            .padding()
                            .background(self.selectedItems.contains(index) ? Color("Tertiary") : Color("Secondary"))
                            .shadow(radius: 30)
                            .cornerRadius(10)
                            Text("Nuts")
                                .font(.caption)
                        }
                    }
                    
                }
                Button("Continue") {
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("Secondary"))
                .controlSize(.large)
                .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .background(Color("Primary"))
            .tabItem {
                Label("Test", systemImage: "barcode.viewfinder")
            }
        }
    }
}

struct AllergySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        AllergySelectionView()
    }
}
