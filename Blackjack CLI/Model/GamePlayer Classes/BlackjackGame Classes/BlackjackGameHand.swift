//
// Created by Matthew Johnson on 10/5/19.
// Copyright (c) 2019 Matthew Johnson. All rights reserved.
//

import Foundation

class BlackjackGameHand {
    private(set) var betAmount: Int
    private var cards: [PlayingCard] = [PlayingCard]()

    init(withBetAmount betAmount:Int) {
        self.betAmount = betAmount
    }
}