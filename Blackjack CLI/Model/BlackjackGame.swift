//
//  Blackjack Game.swift
//  Blackjack CLI
//
//  Created by Matthew Johnson on 3/18/19.
//  Copyright © 2019 Matthew Johnson. All rights reserved.
//

import Foundation

class BlackJackGame{
    private var deck = PlayingCardDeck()
    private(set) var playerCards = [PlayingCard]()
    private(set) var dealerCards = [PlayingCard]()
    var playerHasBusted : Bool {
        return playerTotal > 21
    }
    var dealerHasBusted : Bool {
        return dealerTotal > 21
    }
    var playerTotal : Int {
        let total = getTotalValueOfCards(cards: playerCards)
        return total
    }
    var dealerTotal : Int {
        let total = getTotalValueOfCards(cards: dealerCards)
        return total
    }
    
    init() {
        deck.shuffleCards()
        playerCards += [deck.drawNextCard()]
        dealerCards += [deck.drawNextCard()]
        playerCards += [deck.drawNextCard()]
        dealerCards += [deck.drawNextCard()]
    }
    
    func dealNextCardToPlayer() {
        dealNextCard(to: &playerCards)
    }
    
    func dealNextCardToDealer(){
        dealNextCard(to: &dealerCards)
    }
    
    private func dealNextCard(to cardDeck: inout [PlayingCard]) {
        let nextCard = deck.drawNextCard()
        cardDeck += [nextCard]
    }
    private func getTotalValueOfCards(cards : [PlayingCard]) -> Int {
        var total = 0
        for card in cards {
            total += card.getRankValue()
        }
        //Covert Aces into a value of 1 if value of 11 causes over 21
        for _ in 0 ..< cards.filter({$0.rank == .ace}).count {
            if total > 21 {
                total -= 10
            }
        }
        return total
    }
}
