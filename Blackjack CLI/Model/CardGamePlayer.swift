//
//  CardGamePlayer.swift
//  Blackjack CLI
//
//  Created by Matthew Johnson on 6/7/19.
//  Copyright © 2019 Matthew Johnson. All rights reserved.
//

import Foundation
class CardGamePlayer : GamePlayer {
    var playerCards : [Card] = [Card]()

    /**
     Removes the first card from player. This is the card that is
     at the "bottom" (position 0)
     - Returns: The card removed, or nil if player had no cards.
     */
    public func addCards(_ cards:[Card]) {
        playerCards += cards
    }
    
    /**
     Removes a card at a certain position.
     - Returns: The card removed, or nil if player had no cards
     */
    public func discardCardAt(position index:Int) -> Card? {
        return index < playerCards.count ? playerCards.remove(at: index) : nil
    }
    /**
     Removes the first card from player. This is the card that is
     at the "bottom" (position 0)
     - Returns: The card removed, or nil if player had no cards.
     */
    public func discardFirstCard() -> Card? {
        return discardCardAt(position: 0)
    }
    /**
     Removes the last card from player. This is the card that is
     at the "top" (the highest indexed item)
     - Returns: The card removed, or nil if player had no cards.
     */
    public func discardLastCard() -> Card? {
        return discardCardAt(position: playerCards.count - 1)
    }
    
    public func discardRandomCard() -> Card? {
        return discardCardAt(position: Int.random(in: 0..<playerCards.count))
    }
    
    public func getAllCards() -> [Card] {
        return playerCards
    }
    
    public func shuffleCards() {
        playerCards.shuffle()
    }
    
    public func discardAllCards() -> [Card]? {
        if playerCards.count > 0 {
            let copyOfPlayerCards = playerCards
            playerCards.removeAll()
            return copyOfPlayerCards
        } else {
            return nil
        }
    }
}

