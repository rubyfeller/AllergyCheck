//
//  Allergy.swift
//  AllergyCheck
//
//  Created by Ruby Feller on 07/03/2023.
//

import Foundation

struct Allergy: Codable {
    let displayName: String
    let name: String
    let icon: String
    let description: String
    let symptoms: [String]
}

struct AllergiesData: Codable {
    let allergies: [Allergy]
}
