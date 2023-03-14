//
//  ScanView.swift
//  AllergyCheck
//
//  Created by Ruby Feller on 13/03/2023.
//

import SwiftUI

struct ScanView: View {
    @State private var barcode = ""
    @State private var showingSheet = false
    @StateObject var viewModel = ScanViewModel()
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Image(systemName: "checkmark.square").font(.system(size: 80))
                .foregroundColor(.green)
                .padding()
                .font(.largeTitle)
            Text("AllergyCheck")
                .font(.largeTitle)
            Text("Scan a item")
            TextField("Enter barcode", text: $barcode)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.center)
            Button("Check product", action: {
                print("being called")
                viewModel.getProductBasedOnBarcode(barcode: barcode)
                showingSheet.toggle()
            })
            .tint(Color("Secondary"))
            .controlSize(.large)
            .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .background(Color("Primary"))
        .foregroundStyle(.white)
        .navigationTitle("test")
        .toolbar(.hidden)
        .sheet(isPresented: $showingSheet){
            ResultView(barcode: $barcode)
        }
    }
}

struct ResultView: View {
    @StateObject var viewModel = ScanViewModel()
    @Binding var barcode: String
    
    func checkForAllergy(allergiesArray: Array<String>?, product: Product) -> String {
        // Get the 'Allergies' array from UserDefaults
        let userDefaults = UserDefaults.standard
        let allergies = userDefaults.stringArray(forKey: "Allergies") ?? []

        if let allergens = allergiesArray {
            for allergen in allergens {
                if allergies.contains(allergen) {
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
                    ForEach(viewModel.products, id: \.id) { product in
                        if let brand = product.brands {
                            Text("Brand: \(brand)")
                        }
                        if product.allergensTags != nil {
                            Text(checkForAllergy(allergiesArray: product.allergensTags, product: product))
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
    
    struct ScanView_Previews: PreviewProvider {
        static var previews: some View {
            ScanView()
        }
    }
