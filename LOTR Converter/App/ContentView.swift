//
//  ContentView.swift
//  LOTR Converter
//
//  Created by Mahesh Bansode on 26/12/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showInfoScreen = false
    @State var showCurrencyPicker = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var leftCurrency = Currency.silverPiece
    @State var rightCurrency = Currency.goldPiece
    @FocusState var leftFocus
    @FocusState var rightFocus
    let currencyTip = CurrencyTip()

    var body: some View {
        ZStack {
            // BG Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()

            VStack {
                // Horse img
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)

                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)

                HStack {

                    // Left value
                    VStack {
                        HStack {
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                            Text(leftCurrency.name)
                                .foregroundStyle(.white)
                                .font(.headline)
                        }
                        .padding(.bottom, -2)
                        .onTapGesture {
                            showCurrencyPicker.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)

                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftFocus)
                        
                    }

                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)

                    // Right value
                    VStack {
                        HStack {

                            Text(rightCurrency.name)
                                .foregroundStyle(.white)
                                .font(.headline)
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                        }
                        .padding(.bottom, -2)
                        .onTapGesture {
                            showCurrencyPicker.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)

                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightFocus)
                    }

                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(8)
                .keyboardType(.decimalPad)

                Spacer()

                HStack {
                    Spacer()
                    Button {
                        showInfoScreen.toggle()
                        print("Showing info screen \(showInfoScreen)")
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing, 28)
                }

            }
        }
        .task {
            try? Tips.configure()
        }
        .onChange(
            of: leftCurrency,
            {
                leftAmount = rightCurrency.convert(
                    rightAmount,
                    to: leftCurrency
                )
            }
        )
        .onChange(
            of: rightCurrency,
            {
                rightAmount = leftCurrency.convert(
                    leftAmount,
                    to: rightCurrency
                )
            }
        )

        .onChange(
            of: leftAmount,
            {
                if leftFocus {
                    rightAmount = leftCurrency.convert(
                        leftAmount,
                        to: rightCurrency
                    )
                }
            }
        )
        .onChange(
            of: rightAmount,
            {
                if rightFocus {

                    leftAmount = rightCurrency.convert(
                        rightAmount,
                        to: leftCurrency
                    )
                }
            }
        )
        .sheet(isPresented: $showInfoScreen) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showCurrencyPicker) {
            CurrencySelectionScreen(
                topCurrency: $leftCurrency,
                bottomCurrency: $rightCurrency
            )
        }
    }
}

#Preview {
    ContentView()
}
