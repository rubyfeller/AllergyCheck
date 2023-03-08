//
//  AllergySettingsView.swift
//  AllergyCheck
//
//  Created by Dennis on 07/03/2023.
//

import SwiftUI

let defaults = UserDefaults.standard

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
                                setAllergie(allergie: "milk", value: value)
                            })
                            .onAppear() {
                                milk = defaults.bool(forKey: "milk")
                            }
                    }
                    HStack {
                        Toggle("🥜 Nuts", isOn: $nuts)
                            .onChange(of: nuts, perform: { (value) in
                                setAllergie(allergie: "nuts", value: value)
                            })
                            .onAppear() {
                                nuts = defaults.bool(forKey: "nuts")
                            }
                    }
                    HStack {
                        Toggle("🍎 Fruits", isOn: $fruits)
                            .onChange(of: fruits, perform: { (value) in
                                setAllergie(allergie: "fruits", value: value)
                            })
                            .onAppear() {
                                fruits = defaults.bool(forKey: "fruits")
                            }
                    }
                    HStack {
                        Toggle("🍞 Bread", isOn: $bread)
                            .onChange(of: bread, perform: { (value) in
                                setAllergie(allergie: "bread", value: value)
                            })
                            .onAppear() {
                                bread = defaults.bool(forKey: "bread")
                            }
                    }
                    HStack {
                        Toggle("🌾 Wheat", isOn: $wheat)
                            .onChange(of: wheat, perform: { (value) in
                                setAllergie(allergie: "wheat", value: value)
                            })
                            .onAppear() {
                                wheat = defaults.bool(forKey: "wheat")
                            }
                    }
                    HStack {
                        Toggle("🐟 Fish", isOn: $fish)
                            .onChange(of: fish, perform: { (value) in
                                setAllergie(allergie: "fish", value: value)
                            })
                            .onAppear() {
                                fish = defaults.bool(forKey: "fish")
                            }
                    }
                    HStack {
                        Toggle("🫘 Beans", isOn: $beans)
                            .onChange(of: beans, perform: { (value) in
                                setAllergie(allergie: "beans", value: value)
                            })
                            .onAppear() {
                                beans = defaults.bool(forKey: "beans")
                            }
                    }
                    HStack {
                        Toggle("🥚 Eggs", isOn: $eggs)
                            .onChange(of: eggs, perform: { (value) in
                                setAllergie(allergie: "eggs", value: value)
                            })
                            .onAppear() {
                                eggs = defaults.bool(forKey: "eggs")
                            }
                    }
                    HStack {
                        Toggle("🥬 Celery", isOn: $celery)
                            .onChange(of: celery, perform: { (value) in
                                setAllergie(allergie: "celery", value: value)
                            })
                            .onAppear() {
                                celery = defaults.bool(forKey: "celery")
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
    if value == true {
        defaults.set(value, forKey: allergie)
        playSound(sound: "SwitchAOn")
    }
    else if value == false {
        defaults.set(value, forKey: allergie)
        playSound(sound: "SwitchAOff")
    }
}


struct AllergySettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AllergySettingsView()
    }
}
