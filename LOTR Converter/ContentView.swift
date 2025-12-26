//
//  ContentView.swift
//  LOTR Converter
//
//  Created by Mahesh Bansode on 26/12/25.
//

import SwiftUI

struct ContentView: View {
    @State var showInfoScreen = false
    @State var leftAmount = ""
    @State var rightAmount = ""

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
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                            Text("Silver Piece")
                                .foregroundStyle(.white)
                                .font(.headline)
                        }
                        .padding(.bottom, -2)

                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                    }

                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)

                    // Right value
                    VStack {
                        HStack {

                            Text("Gold Piece")
                                .foregroundStyle(.white)
                                .font(.headline)
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                        }
                        .padding(.bottom, -2)

                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                    }

                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()

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
                    }.padding(.trailing, 28)
                }

            }
        }
    }
}

#Preview {
    ContentView()
}
