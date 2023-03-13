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
    
    var body: some View {
        VStack {
            Text(viewModel.barcode)
            ForEach(viewModel.products, id: \.id) { product in
                Text("it is not safe: \(product.allergensFromIngredients)")
                Text("Brand: \(product.brands)")
                AsyncImage(url: URL(string: product.imageURL)) { image in
                    image.resizable()
                        .frame(width: 300, height: 300)
                } placeholder: {
                    ProgressView()
                }
                
            }
        }.onAppear {
            viewModel.getProductBasedOnBarcode(barcode: barcode)
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
