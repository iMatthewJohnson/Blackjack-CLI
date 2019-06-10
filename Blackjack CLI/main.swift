//
//  main.swift
//  Blackjack CLI
//
//  Created by Matthew Johnson on 3/18/19.
//  Copyright © 2019 Matthew Johnson. All rights reserved.
//

import Foundation
func printCards() {
    let playerCards = player.getAllCards()
    for card in playerCards {
        print(card)
    }
}

//let gameController = BlackjackGameController()
//gameController.startGame()
let player = PlayingCardGamePlayer()
let deck = PlayingCardDeck()
deck.shuffleCards()
for _ in 1...30 {
    player.addCards(cards: [deck.drawNextCard()]);
}
player.orderCardsByRank()
print()
printCards()


