//
//  ScanView.swift
//  AllergyCheck
//
//  Created by Ruby Feller on 13/03/2023.
//

import SwiftUI

struct ScanView: View {
    @State private var barcode = ""
    @State var showingSheet = false
    @StateObject private var viewModel = ScanViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "checkmark.square").font(.system(size: 80))
                    .foregroundColor(.green)
                    .padding()
                    .font(.largeTitle)
                Text("AllergyCheck")
                    .font(.largeTitle)
                Text("Scan an item")
                Button("Start scanning") {
                    showingSheet.toggle()
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("Secondary"))
                .controlSize(.large)
                .fontWeight(.bold)
                // Debugging purposes:
                //                TextField("Enter barcode", text: $barcode)
                //                    .keyboardType(.decimalPad)
                //                    .multilineTextAlignment(.center)
                //                Button("Check product", action: {
                //                    showingSheet.toggle()
                //                })
                .tint(Color("Secondary"))
                .controlSize(.large)
                .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .background(colorScheme == .dark ? Color.black : Color("Primary"))
            .foregroundStyle(.white)
            .fontWeight(.bold)
            //            .navigationTitle("test")
            .toolbar(.hidden)
            .sheet(isPresented: $showingSheet){
                CameraView()
            }
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: ScanView().preferredColorScheme)
    }
}
