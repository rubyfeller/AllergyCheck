//
//  AllergySelectionView.swift
//  AllergyCheck
//
//  Created by Ruby Feller on 06/03/2023.
//

import SwiftUI

struct AllergySelectionView: View {
    
    @State private var selectedItems: [String] = []
    
    @Environment(\.colorScheme) var colorScheme
    
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
                                if let selectedItemIndex = self.selectedItems.firstIndex(of: allergies[index].name) {
                                    selectedItems.remove(at: selectedItemIndex)
                                } else {
                                    self.selectedItems.append(allergies[index].name)
                                    print(selectedItems)
                                }
                            }
                            .padding()
                            .background(self.selectedItems.contains(allergies[index].name) ? Color("Tertiary") : Color("Secondary"))
                            .cornerRadius(10)
                            .shadow(color: .black, radius: 0.5, x: 0, y: 0.5)
                            Text(allergies[index].name)
                                .font(.caption)
                        }
                    }
                    
                }
                
                NavigationLink(destination: MainView()) {
                    Text("Continue")
                }.simultaneousGesture(TapGesture().onEnded {
                    UserDefaults.standard.set(selectedItems, forKey: "Allergies")
                    UserDefaults.standard.set(true, forKey: "Onboarding")
                    print(selectedItems)
                })
                .buttonStyle(.borderedProminent)
                .tint(Color("Secondary"))
                .cornerRadius(8)
                .shadow(color: .black, radius: 0.5, x: 0, y: 0.5)
                .controlSize(.large)
                .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .background(colorScheme == .dark ? Color.black : Color("Primary"))
            .foregroundStyle(.white)
            .fontWeight(.bold)
            .navigationBarBackButtonHidden(true)
    }
}

struct AllergySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        AllergySelectionView()
    }
}
