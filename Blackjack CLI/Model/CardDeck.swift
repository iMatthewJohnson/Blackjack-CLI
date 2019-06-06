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
    
    func drawNextCard() -> Card {
        return cards.remove(at: 0)
    }
}
