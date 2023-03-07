//
//  AllergySelectionView.swift
//  AllergyCheck
//
//  Created by Ruby Feller on 06/03/2023.
//

import SwiftUI

struct AllergySelectionView: View {
    
    private let range: ClosedRange<Int> = 0...8
    @State private var selectedItems: [Int] = []
    
    let allergies: [Allergy]
    
    init() {
        if let allergiesData: AllergiesData = Bundle.main.decode("allergies.json") {
            self.allergies = allergiesData.allergies
        } else {
            self.allergies = []
        }
    }
    
    var body: some View {
        
        VStack {
            Text("Choose your allergies")
                .foregroundColor(.white)
                .padding(50)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(allergies.indices, id: \.self) { index in
                    VStack {
                        Button(allergies[index].icon) {
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
                        Text(allergies[index].name)
                            .font(.caption)
                    }
                }
                
            }
            
            Button("Continue") {
                UserDefaults.standard.set(selectedItems, forKey: "Allergies")
                print(selectedItems)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("Secondary"))
            .controlSize(.large)
            .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .background(Color("Primary"))
    }
}

struct AllergySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        AllergySelectionView()
    }
}
