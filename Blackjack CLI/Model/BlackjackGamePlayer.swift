//
// Created by Matthew Johnson on 10/1/19.
// Copyright (c) 2019 Matthew Johnson. All rights reserved.
//

import Foundation

class BlackjackGamePlayer: PlayingCardGamePlayer {
    public func getValueOfCards() -> Int {
        var total = super.getValueOfCards()
        // Only counting card values that are flipped up. If it's flipped down then it's hidden and we don't know the value.
        let playersHand = playerCards.filter({$0.isFaceUp == true}) as! [PlayingCard]
        // Covert Aces into a value of 1 if value of 11 causes over 21
        for _ in 0 ..< playersHand.filter({$0.rank == .ace}).count {
            if total > 21 {
                total -= 10
            }
        }
        return total
    }
}