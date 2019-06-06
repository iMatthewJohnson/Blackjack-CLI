//
//  PlayingCard.swift
//  Blackjack CLI
//
//  Created by Matthew Johnson on 3/18/19.
//  Copyright © 2019 Matthew Johnson. All rights reserved.
//

import Foundation
class PlayingCard : Card, CustomDebugStringConvertible {
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
            rankString = "\(rankValue)"
        }
        return "\(rankString)\(suitString)"
    }
    
    let suit: Suit
    let rank: Rank
    var rankValue : Int {
        switch rank {
        case .jack, .queen, .king:
            return 10
        case .ace:
            return 11
        default:
            return rank.rawValue + 2
        }
    }
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    enum Suit : String, CaseIterable {
        case spades,clubs,hearts,diamonds
    }
    
    enum Rank: Int, CaseIterable {
        case two,three,four,five,six,seven,eight,nine,ten,jack,queen,king,ace
    }
}
