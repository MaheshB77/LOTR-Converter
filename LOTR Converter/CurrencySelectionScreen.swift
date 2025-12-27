//
//  CurrencySelectionScreen.swift
//  LOTR Converter
//
//  Created by Mahesh Bansode on 27/12/25.
//

import SwiftUI

struct CurrencySelectionScreen: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)

            VStack {

                Text("Select the currency you want to convert : ")
                    .fontWeight(.bold)

                // Currency Icons Grid
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(0..<3) { _ in
                        CurrencyIcon(img: .goldpenny, title: "Golden Penny")
                    }
                }

                Text("Select the currency you would like to convert into : ")
                    .fontWeight(.bold)

                Button("Got it!") {
                    dismiss()
                }
                .font(.title2)
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .padding()
            }
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    CurrencySelectionScreen()
}
