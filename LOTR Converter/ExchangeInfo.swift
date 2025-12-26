//
//  ExchangeInfo.swift
//  LOTR Converter
//
//  Created by Mahesh Bansode on 26/12/25.
//

import SwiftUI

struct ExchangeInfo: View {
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

                Text(
                    "Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:"
                )
                .padding()
                .font(.title3)

                HStack {
                    Image(.goldpiece)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 32)

                    Text("1 Gold Piece = 4 Gold Pennies")

                    Image(.goldpenny)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 32)
                }

                Button("Got it!") {

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
