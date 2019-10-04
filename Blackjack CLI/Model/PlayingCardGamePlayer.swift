//
//  PlayingCardGame.swift
//  Blackjack CLI
//
//  Created by Matthew Johnson on 6/8/19.
//  Copyright © 2019 Matthew Johnson. All rights reserved.
//

import Foundation

class PlayingCardGamePlayer: CardGamePlayer
{
    // MARK: Init
    override init() {
        super.init()
        playerCards = [PlayingCard]()
    }
    
    // MARK: Public Functions
    public func numberOPlayingCardsWith(suit:PlayingCard.Suit) -> Int {
        return (playerCards as! [PlayingCard]).filter({$0.suit == suit}).count
    }
    
    public func numberOfPlayingCardsWith(rank:PlayingCard.Rank) -> Int {
         return (playerCards as! [PlayingCard]).filter({$0.rank == rank}).count
    }
    
    public func numberOfPlayingCardsWith(rank:PlayingCard.Rank, andSuit suit:PlayingCard.Suit) -> Int {
        return (playerCards as! [PlayingCard]).filter({$0.rank == rank && $0.suit == suit}).count
    }
    
    public func orderCardsByRank(where aceHasValueOfOne:Bool = false) {
        playerCards.sort(by: {($0 as! PlayingCard).rank.rawValue < ($1 as! PlayingCard).rank.rawValue})
        if aceHasValueOfOne {
            while (playerCards.last as! PlayingCard).rank == .ace {
                // Swift does not appear to have a swap or move function in arrays, so this
                // removes the last element (which would be an Ace) and inserts at begining.
                playerCards.insert(playerCards.removeLast(), at: 0)
            }
        }
    }
    
    public func getValueOfCards(whereAceHasValueOfOne aceHasValueOfOne:Bool = false, onlyCountingCardsFaceUp:Bool? = nil ) -> Int {
        var sum = 0
        //let cardsToBeCounted : [Card]
        let cardsToBeCounted =  onlyCountingCardsFaceUp == true ? playerCards.filter({$0.isFaceUp == true}) : playerCards
        for card in (cardsToBeCounted as! [PlayingCard]) {
            sum += card.getRankValue(where: aceHasValueOfOne)
        }
        return sum
    }
    
}
