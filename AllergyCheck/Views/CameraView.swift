//
//  CameraView.swift
//  AllergyCheck
//
//  Created by Dennis on 14/03/2023.
//

import SwiftUI
import CodeScanner

struct CameraView: View {
    @State private var isPresentingScanner = false
    @State private var scannedCode: String = "Scan a product barcode to get started."
    
    var scannerSheet: some View {
        CodeScannerView(
            codeTypes: [.ean13],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                }
            }
        )
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text(scannedCode)
                Button("Scan Product barcode") {
                    self.isPresentingScanner = true
                }
                .sheet(isPresented: $isPresentingScanner) {
                    self.scannerSheet
                }
            }
            .navigationTitle("Scanner")
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
