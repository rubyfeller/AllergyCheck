//
//  Product.swift
//  AllergyCheck
//
//  Created by Ruby Feller on 13/03/2023.
//

import Foundation

struct Response: Codable {
    let code: String
    let product: Product?
    let status: Int
    let statusVerbose: String
    
    enum CodingKeys: String, CodingKey {
        case code, product, status
        case statusVerbose = "status_verbose"
    }
}

struct Product: Hashable, Codable {
    let id: String
    let allergens, allergensFromIngredients, allergensFromUser: String?
    let allergensHierarchy: [String]?
    let allergensLc: String?
    let allergensTags: [String]?
    let brands: String?
    let brandsTags: [String]?
    let imageURL: String?
    let productName: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case allergens
        case allergensFromIngredients = "allergens_from_ingredients"
        case allergensFromUser = "allergens_from_user"
        case allergensHierarchy = "allergens_hierarchy"
        case allergensLc = "allergens_lc"
        case allergensTags = "allergens_tags"
        case brands
        case brandsTags = "brands_tags"
        case imageURL = "image_url"
        case productName = "product_name"
    }
}
