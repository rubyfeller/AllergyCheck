//
//  ResultView.swift
//  AllergyCheck
//
//  Created by Ruby Feller on 14/03/2023.
//

import SwiftUI

struct ResultView: View {
    @StateObject var viewModel = ScanViewModel()
    @Binding var barcode: String
    @State private var allergen = ""
    
    func checkForAllergy(allergiesArray: Array<String>?, product: Product) -> String {
        // Get the 'Allergies' array from UserDefaults
        let userDefaults = UserDefaults.standard
        let allergies = userDefaults.stringArray(forKey: "Allergies") ?? []
        
        if let allergens = allergiesArray {
            for allergen in allergens {
                if allergies.contains(allergen) {
                    self.allergen = allergen
                    return "\(product.productName ?? "The product") contains one of your allergies: \(allergen) ⛔️"
                }
            }
            return "\(product.productName ?? "The product") is safe to consume: it does not contain any of your allergies ☑️"
        }
        
        return ""
    }
    
    
    var body: some View {
        VStack {
            ForEach(viewModel.response, id: \.code) { response in
                if (response.status != 1) {
                    Text("Product not found")
                }
                else {
                    Text("Product has been found 🥳")
                        .font(.title)
                    ForEach(viewModel.products, id: \.id) { product in
                        Text(product.productName ?? "Unknown productname")
                            .font(.title3)
                        if let brand = product.brands {
                            Text("Brand: \(brand)")
                        }
                        if product.allergensTags != nil {
                            Text(checkForAllergy(allergiesArray: product.allergensTags, product: product))
                            Text(allergen)
                            AsyncImage(url: URL(string: product.imageURL ?? "https://www.freepnglogos.com/uploads/dog-png/bow-wow-gourmet-dog-treats-are-healthy-natural-low-4.png")) { image in
                                image.resizable()
                                    .frame(width: 300, height: 300)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .background(Color("Primary"))
        .foregroundStyle(.white)
        .fontWeight(.bold)
        .onAppear {
            viewModel.getProductBasedOnBarcode(barcode: barcode)
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(barcode: Binding.constant("8718452530298"))
    }
}
