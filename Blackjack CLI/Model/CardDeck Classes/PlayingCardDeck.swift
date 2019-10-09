//
//  PlayingCardDeck.swift
//  Blackjack CLI
//
//  Created by Matthew Johnson on 3/18/19.
//  Copyright © 2019 Matthew Johnson. All rights reserved.
//

import Foundation

class PlayingCardDeck : CardDeck {

    override init() {
        super.init()
        //TODO: Add shuffle option (boolean-> default false) after creation
        addCards(createDeck())
    }

private func createDeck()->[PlayingCard] {
    var deck = [PlayingCard]()
    for suit in PlayingCard.Suit.allCases {
        for rank in PlayingCard.Rank.allCases {
            let card = PlayingCard(suit: suit, rank: rank)
            deck += [card]
        }
    }
    return deck
}
    
override func drawNextCard(withCardFacing cardOrientation: CardFaceOrientation?) -> PlayingCard {
    return super.drawNextCard(withCardFacing: cardOrientation) as! PlayingCard
}
}
