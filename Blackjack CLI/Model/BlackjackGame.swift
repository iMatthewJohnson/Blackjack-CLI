//
//  Blackjack Game.swift
//  Blackjack CLI
//
//  Created by Matthew Johnson on 3/18/19.
//  Copyright © 2019 Matthew Johnson. All rights reserved.
//

import Foundation

struct BlackJackGame {
    private var deck: PlayingCardDeck
    private(set) var player = BlackjackGamePlayer()
    private(set) var dealer = BlackjackGamePlayer(isDealer: true)

    init(withNumberOfDecks numberOfDecks: Int = 8) {
        deck = PlayingCardDeck()
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
}
