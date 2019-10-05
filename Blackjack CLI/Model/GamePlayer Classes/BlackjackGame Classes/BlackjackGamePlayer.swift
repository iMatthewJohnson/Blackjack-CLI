//
// Created by Matthew Johnson on 10/1/19.
// Copyright (c) 2019 Matthew Johnson. All rights reserved.
//

import Foundation

class BlackjackGamePlayer: PlayingCardGamePlayer {
    var playerHandAction: BlackjackGamePlayerHandAction? {
        get {
            if self.isDealer {
                return self.playerTotal <= 16 ? .hit : .stand
            } else {
                return self.playerHandAction
            }
        }
        set {
            self.playerHandAction = newValue
        }
    }
    let isDealer: Bool
    var hasBusted : Bool {
        playerTotal > 21
    }
    var playerTotal : Int {
        self.getValueOfCards()
    }

    init(isDealer:Bool = false) {
        self.isDealer = isDealer
    }

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