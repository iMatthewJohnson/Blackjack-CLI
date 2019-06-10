//
//  PlayingCard.swift
//  Blackjack CLI
//
//  Created by Matthew Johnson on 3/18/19.
//  Copyright © 2019 Matthew Johnson. All rights reserved.
//

import Foundation
class PlayingCard : Card, CustomDebugStringConvertible {
    let suit: Suit
    let rank: Rank
    
    var debugDescription: String {
        let suitString : String
        let rankString : String
        switch suit {
        case .clubs:
            suitString = "♣"
        case .diamonds:
            suitString = "♦"
        case .hearts:
            suitString = "♥"
        case .spades:
            suitString = "♠"
        }
        switch rank {
        case .jack:
            rankString = "J"
        case .queen:
            rankString = "Q"
        case .king:
            rankString = "K"
        case .ace:
            rankString = "A"
        default:
            rankString = "\(getRankValue())"
        }
        return "\(rankString)\(suitString)"
    }
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    public func getRankValue(where aceHasValueOfOne:Bool = false) -> Int {
        switch rank {
        case .jack, .queen, .king:
            return 10
        case .ace:
            return aceHasValueOfOne ? 1 : 11
        default:
            return rank.rawValue + 2
        }
    }
    enum Suit : String, CaseIterable {
        case spades,clubs,hearts,diamonds
    }
    
    enum Rank: Int, CaseIterable {
        case two,three,four,five,six,seven,eight,nine,ten,jack,queen,king,ace
    }
}
