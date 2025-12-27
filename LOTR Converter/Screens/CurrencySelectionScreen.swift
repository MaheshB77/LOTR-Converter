//
//  CurrencySelectionScreen.swift
//  LOTR Converter
//
//  Created by Mahesh Bansode on 27/12/25.
//

import SwiftUI

struct CurrencySelectionScreen: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency

    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)

            VStack {

                Text("Select the currency you want to convert : ")
                    .fontWeight(.bold)
                IconGrid(selectedCurrency: $topCurrency)

                Text("Select the currency you would like to convert into : ")
                    .fontWeight(.bold)
                    .padding(.top)
                IconGrid(selectedCurrency: $bottomCurrency)

                Button("Done") {
                    dismiss()
                }
                .font(.title2)
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .padding()
                .foregroundStyle(.white)
            }
            .multilineTextAlignment(.center)
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    @Previewable @State var topCurrency: Currency = .goldPiece
    @Previewable @State var bottomCurrency: Currency = .goldPiece
    CurrencySelectionScreen(
        topCurrency: $topCurrency,
        bottomCurrency: $bottomCurrency
    )
}
