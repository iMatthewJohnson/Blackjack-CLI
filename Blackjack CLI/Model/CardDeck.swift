//
//  CardDeck.swift
//  Blackjack CLI
//
//  Created by Matthew Johnson on 3/18/19.
//  Copyright © 2019 Matthew Johnson. All rights reserved.
//

import Foundation
class CardDeck {
    private(set) var cards = [Card]()
    
    func shuffleCards() {
        cards.shuffle()
    }
    
    func addCard(card : Card) {
        cards += [card]
    }
    
    func drawNextCard(withCardFacing cardOrientation: CardFaceOrientation?) -> Card {
        let card = cards.remove(at: 0)
        card.setFace(cardOrientation);
        return card
    }
}
