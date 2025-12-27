//
//  ExchangeInfo.swift
//  LOTR Converter
//
//  Created by Mahesh Bansode on 26/12/25.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)

            VStack {
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(4)
                    .foregroundStyle(.brown.mix(with: .black, by: 0.5))

                Text(
                    "Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:"
                )
                .padding()
                .font(.title3)
                .foregroundStyle(.brown.mix(with: .black, by: 0.3))

                ExchangeRate(
                    leftImg: .goldpiece,
                    rightImg: .goldpenny,
                    conversionText: "1 Gold Piece = 4 Gold Pennies"
                )
                ExchangeRate(
                    leftImg: .goldpenny,
                    rightImg: .silverpiece,
                    conversionText: "1 Gold Penny = 4 Silver Pieces"
                )
                ExchangeRate(
                    leftImg: .silverpiece,
                    rightImg: .silverpenny,
                    conversionText: "1 Silver Piece = 4 Silver Pennies"
                )
                ExchangeRate(
                    leftImg: .silverpenny,
                    rightImg: .copperpenny,
                    conversionText: "1 Silver Penny = 4 Copper Pennies"
                )

                Button("Got it!") {
                    dismiss()
                }
                .font(.title2)
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .padding()
            }
        }
    }
}

#Preview {
    ExchangeInfo()
}
