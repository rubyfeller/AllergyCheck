//
//  AllergySettingsView.swift
//  AllergyCheck
//
//  Created by Dennis on 07/03/2023.
//

import SwiftUI

var defaults = UserDefaults.standard
var allergies = defaults.array(forKey: "Allergies") as? [String]

struct AllergySettingsView: View {
    
    @State private var milk = false
    @State private var nuts = false
    @State private var fruits = false
    @State private var bread = false
    @State private var wheat = false
    @State private var fish = false
    @State private var beans = false
    @State private var eggs = false
    @State private var celery = false
        
    var body: some View {
        VStack {
            Form {
                Section {
                    Text("Keep your allergies up-to-date to prevent reactions")
                }
                Section {
                    HStack {
                        Toggle("🥛 Milk", isOn: $milk)
                            .onChange(of: milk, perform: { (value) in
                                setAllergie(allergie: "Milk", value: value)
                            })
                            .onAppear() {
                                if allergies?.contains("Milk") == true {
                                    milk = true
                                }
                            }
                    }
                    HStack {
                        Toggle("🥜 Nuts", isOn: $nuts)
                            .onChange(of: nuts, perform: { (value) in
                                setAllergie(allergie: "Nuts", value: value)
                            })
                            .onAppear() {
                                if allergies?.contains("Nuts") == true {
                                    nuts = true
                                }
                            }
                    }
                    HStack {
                        Toggle("🍎 Fruits", isOn: $fruits)
                            .onChange(of: fruits, perform: { (value) in
                                setAllergie(allergie: "Fruits", value: value)
                            })
                            .onAppear() {
                                if allergies?.contains("Fruits") == true {
                                    fruits = true
                                }
                            }
                    }
                    HStack {
                        Toggle("🍞 Bread", isOn: $bread)
                            .onChange(of: bread, perform: { (value) in
                                setAllergie(allergie: "Bread", value: value)
                            })
                            .onAppear() {
                                if allergies?.contains("Bread") == true {
                                    bread = true
                                }
                            }
                    }
                    HStack {
                        Toggle("🌾 Wheat", isOn: $wheat)
                            .onChange(of: wheat, perform: { (value) in
                                setAllergie(allergie: "Wheat", value: value)
                            })
                            .onAppear() {
                                if allergies?.contains("Wheat") == true {
                                    wheat = true
                                }
                            }
                    }
                    HStack {
                        Toggle("🐟 Fish", isOn: $fish)
                            .onChange(of: fish, perform: { (value) in
                                setAllergie(allergie: "en:fish", value: value)
                            })
                            .onAppear() {
                                if allergies?.contains("en:fish") == true {
                                    fish = true
                                }
                            }
                    }
                    HStack {
                        Toggle("🫘 Beans", isOn: $beans)
                            .onChange(of: beans, perform: { (value) in
                                setAllergie(allergie: "Beans", value: value)
                            })
                            .onAppear() {
                                if allergies?.contains("Beans") == true {
                                    beans = true
                                }
                            }
                    }
                    HStack {
                        Toggle("🥚 Eggs", isOn: $eggs)
                            .onChange(of: eggs, perform: { (value) in
                                setAllergie(allergie: "Eggs", value: value)
                            })
                            .onAppear() {
                                if allergies?.contains("Eggs") == true {
                                    eggs = true
                                }
                            }
                    }
                    HStack {
                        Toggle("🥬 Celery", isOn: $celery)
                            .onChange(of: celery, perform: { (value) in
                                setAllergie(allergie: "Celery", value: value)
                            })
                            .onAppear() {
                                if allergies?.contains("Celery") == true {
                                    celery = true
                                }
                            }
                    }
                    
                } header: {
                    Text("Set your allergies")
                }
            }
            .navigationTitle("Allergy Settings")
        }
    }
}

func setAllergie(allergie: String, value: Bool) {
    if value == false {
        allergies = allergies?.filter({$0 != allergie})
        defaults.set(allergies, forKey: "Allergies")
        playSound(sound: "SwitchAOff")
    }
    else {
        if allergies?.contains(allergie) == false  {
            allergies?.append(allergie)
            defaults.set(allergies, forKey: "Allergies")
            playSound(sound: "SwitchAOn")
        }
    }
}

struct AllergySettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AllergySettingsView()
    }
}
