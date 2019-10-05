//
//  Blackjack Game.swift
//  Blackjack CLI
//
//  Created by Matthew Johnson on 3/18/19.
//  Copyright © 2019 Matthew Johnson. All rights reserved.
//

import Foundation

class BlackJackGame{
    private var deck = PlayingCardDeck()
    private(set) var player = BlackjackGamePlayer()
    private(set) var dealer = BlackjackGamePlayer(isDealer: true)
    var playerHasBusted : Bool {
        playerTotal > 21
    }
    var dealerHasBusted : Bool {
        dealerTotal > 21
    }
    var playerTotal : Int {
        player.getValueOfCards()
    }
    var dealerTotal : Int {
        dealer.getValueOfCards()
    }
    
    init() {
        deck.shuffleCards()
        player.addCards([deck.drawNextCard(withCardFacing: .up)])
        dealer.addCards([deck.drawNextCard(withCardFacing: .up)])
        player.addCards([deck.drawNextCard(withCardFacing: .up)])
        dealer.addCards([deck.drawNextCard(withCardFacing: .down)])
    }

    
    func dealNextCard(to player: BlackjackGamePlayer, withCardFlipped cardOrientation: CardFaceOrientation?) {
        let nextCard = deck.drawNextCard(withCardFacing: cardOrientation)
        player.playerCards += [nextCard]
    }
    private func getTotalValueOfCards(_ cards : [PlayingCard]) -> Int {
        var total = 0
        for card in cards {
            total += card.getRankValue()
        }
        //Covert Aces into a value of 1 if value of 11 causes over 21
        for _ in 0 ..< cards.filter({$0.rank == .ace}).count {
            if total > 21 {
                total -= 10
            }
        }
        return total
    }
}
