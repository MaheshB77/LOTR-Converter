//
//  ExchangeRate.swift
//  LOTR Converter
//
//  Created by Mahesh Bansode on 26/12/25.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImg: ImageResource
    let rightImg: ImageResource
    let conversionText: String

    var body: some View {
        HStack {
            Image(leftImg)
                .resizable()
                .scaledToFit()
                .frame(height: 32)

            Text(conversionText)
                .foregroundStyle(.brown.mix(with: .black, by: 0.3))

            Image(rightImg)
                .resizable()
                .scaledToFit()
                .frame(height: 32)
        }
    }
}
