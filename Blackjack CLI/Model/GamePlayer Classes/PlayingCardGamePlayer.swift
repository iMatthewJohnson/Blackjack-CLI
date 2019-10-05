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
    override init() {
        super.init()
        playerCards = [PlayingCard]()
    }

    public func numberOPlayingCardsWith(suit:PlayingCard.Suit) -> Int {
        return (playerCards as! [PlayingCard]).filter({$0.suit == suit}).count
    }
    
    public func numberOfPlayingCardsWith(rank:PlayingCard.Rank) -> Int {
         return (playerCards as! [PlayingCard]).filter({$0.rank == rank}).count
    }
    
    public func numberOfPlayingCardsWith(rank:PlayingCard.Rank, andSuit suit:PlayingCard.Suit) -> Int {
        return (playerCards as! [PlayingCard]).filter({$0.rank == rank && $0.suit == suit}).count
    }
    
    public func orderCardsByRank(whereAceHasValueOf aceValue: PlayingCard.AceValue = .eleven) {
        playerCards.sort(by: {($0 as! PlayingCard).rank.rawValue < ($1 as! PlayingCard).rank.rawValue})
        if aceValue == .one {
            while (playerCards.last as! PlayingCard).rank == .ace {
                // Swift does not appear to have a swap or move function in arrays, so this
                // removes the last element (which would be an Ace) and inserts at beginning.
                playerCards.insert(playerCards.removeLast(), at: 0)
            }
        }
    }
    
    public func getValueOfCards(whereAceHasValueOf aceValue: PlayingCard.AceValue = .eleven, onlyCountingCardsFaceUp:Bool? = nil ) -> Int {
        var sum = 0
        let cardsToBeCounted = onlyCountingCardsFaceUp == true ? playerCards.filter({ $0.isFaceUp == true }) : playerCards
        for card in (cardsToBeCounted as! [PlayingCard]) {
            sum += card.getRankValue(whereAcesHasAValueOf: aceValue)
        }
        return sum
    }
}

