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
        for suit in PlayingCard.Suit.allCases {
            for rank in PlayingCard.Rank.allCases {
                let card = PlayingCard(suit: suit, rank: rank)
                addCard(card: card)
            }
        }
    }
    
    override func drawNextCard(withCardFacing cardOrientation: CardFaceOrientation?) -> PlayingCard {
        return super.drawNextCard(withCardFacing: cardOrientation) as! PlayingCard
    }
}
