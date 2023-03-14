//
//  ScanViewModel.swift
//  AllergyCheck
//
//  Created by Ruby Feller on 13/03/2023.
//

import Foundation

@MainActor class ScanViewModel: ObservableObject {
    @Published private(set) var response: [Response] = []
    @Published private(set) var products: [Product] = []
    @Published private(set) var allergens = ""
    @Published private(set) var barcode = ""
    @Published private(set) var hasError = false
    @Published private(set) var errorMessage = ""
    
    private let baseURL = "https://world.openfoodfacts.org/api/v2/product/"
    
    func getProductBasedOnBarcode(barcode: String) {
        
        print("barcode : \(barcode)")
        guard let url = URL(string: "\(baseURL)\(barcode)") else {
            hasError = true
            errorMessage = "Invalid URL"
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    self.hasError = true
                    self.errorMessage = error.localizedDescription
                    print(error)
                }
            } else if let data = data {
                do {
                    let response = try JSONDecoder().decode(Response.self, from: data)
                    DispatchQueue.main.async {
                        print(response)
                        self.response.append(response)
                        if ((response.product) != nil) {
//                            for (key, value) in UserDefaults.standard.dictionaryRepresentation() {
//                                print("\(key) = \(value) \n")
//                            }
                            self.products.append(response.product!)
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        print(error)
                        self.hasError = true
                        self.errorMessage = error.localizedDescription
                    }
                }
            }
        }.resume()
    }
}
