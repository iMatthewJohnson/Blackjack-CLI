//
// Created by Matthew Johnson on 10/1/19.
// Copyright (c) 2019 Matthew Johnson. All rights reserved.
//

import Foundation

class BlackjackGamePlayer: PlayingCardGamePlayer {
    var playerHandAction: BlackjackGamePlayerHandAction?

    public func getValueOfCards() -> Int {
        var total = super.getValueOfCards(onlyCountingCardsFaceUp: true)
        // Covert Aces into a value of 1 if value of 11 causes over 21
        let playersHand = playerCards.filter({$0.isFaceUp == true}) as! [PlayingCard]
        for _ in 0 ..< playersHand.filter({$0.rank == .ace}).count {
            if total > 21 {
                total -= 10
            }
        }
        return total
    }
}

enum BlackjackGamePlayerHandAction: String {
    case hit, stand
}