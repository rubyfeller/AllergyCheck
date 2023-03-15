//
//  CameraView.swift
//  AllergyCheck
//
//  Created by Dennis on 14/03/2023.
//

import SwiftUI
import CodeScanner

struct CameraView: View {
    @State private var isPresentingScanner = true
    @State private var scannedCode: String = "Scan a product barcode to get started."
    @StateObject var viewModel = ScanViewModel()
    @State private var showResultView = false
    
    var scannerSheet: some View {
        CodeScannerView(
            codeTypes: [.ean13],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.showResultView = true
                    viewModel.getProductBasedOnBarcode(barcode: code.string)
                    self.isPresentingScanner = false
                }
            }
        )
    }
    
    var body: some View {
        if (showResultView) {
            ResultView(barcode: $scannedCode)
        } else {
            self.scannerSheet
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: CameraView().preferredColorScheme)
    }
}
