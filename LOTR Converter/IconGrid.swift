//
//  IconGrid.swift
//  LOTR Converter
//
//  Created by Mahesh Bansode on 27/12/25.
//

import SwiftUI

struct IconGrid: View {
    @Binding var selectedCurrency: Currency

    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { currency in

                CurrencyIcon(img: currency.image, title: currency.name)
                    .overlay(
                        (selectedCurrency == currency)
                            ? RoundedRectangle(cornerRadius: 12)
                                .stroke(.black, lineWidth: 2)
                                .opacity(0.8)
                            : nil
                    ).onTapGesture {
                        selectedCurrency = currency
                    }
            }
        }
    }
}
