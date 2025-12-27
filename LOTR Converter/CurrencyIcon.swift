//
//  CurrencyIcon.swift
//  LOTR Converter
//
//  Created by Mahesh Bansode on 27/12/25.
//

import SwiftUI

struct CurrencyIcon: View {
    let img: ImageResource
    let title: String
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(img)
                .resizable()
                .scaledToFit()
                .padding(2)
            
            Text(title)
                .padding(2)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(2)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 12))
    }
}

//#Preview {
//    CurrencyIcon()
//}
