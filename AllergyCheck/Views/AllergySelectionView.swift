//
//  AllergySelectionView.swift
//  AllergyCheck
//
//  Created by Ruby Feller on 06/03/2023.
//

import SwiftUI

struct AllergySelectionView: View {
    
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
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 0)]) {
                    ForEach(allergies.indices, id: \.self) { index in
                        VStack {
                            Button(allergies[index].icon) {
                                if let selectedItemIndex = self.selectedItems.firstIndex(of: index) {
                                    selectedItems.remove(at: selectedItemIndex)
                                } else {
                                    self.selectedItems.append(index)
                                }
                            }
                            .padding()
                            .background(self.selectedItems.contains(index) ? Color("Tertiary") : Color("Secondary"))
                            .cornerRadius(10)
                            .shadow(color: .black, radius: 0.5, x: 0, y: 0.5)
                            Text(allergies[index].name)
                                .font(.caption)
                        }
                    }
                    
                }
                
                NavigationLink(destination: SettingsView()) {
                    Text("Continue")
                }.onTapGesture {
                    UserDefaults.standard.set(selectedItems, forKey: "Allergies")
                    print(selectedItems)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("Secondary"))
                .cornerRadius(8)
                .shadow(color: .black, radius: 0.5, x: 0, y: 0.5)
                .controlSize(.large)
                .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .background(Color("Primary"))
            .foregroundStyle(.white)
            .fontWeight(.bold)
    }
}

struct AllergySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        AllergySelectionView()
    }
}
