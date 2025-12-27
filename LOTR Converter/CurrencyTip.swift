//
//  CurrencyTip.swift
//  LOTR Converter
//
//  Created by Mahesh Bansode on 28/12/25.
//

import TipKit

struct CurrencyTip: Tip {

    var title = Text("Did you know?")
    var message: Text? = Text("You can tap left or right currency icons to change them!")
    var image: Image? = Image(systemName: "hand.tap")
}
