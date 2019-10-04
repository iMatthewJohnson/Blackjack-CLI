//
//  BlackjackGameController.swift
//  Blackjack CLI
//
//  Created by Matthew Johnson on 3/20/19.
//  Copyright © 2019 Matthew Johnson. All rights reserved.
//

import Foundation

class BlackjackGameController {
    let game = BlackJackGame()
    
    public func startGame() {
        print("Welcome to Blackjack. Press Enter when you're reading to begin")
        // Used to pause app and wait for user to press ENTER
        _ = readLine()
        print("You were dealt a \(game.player.playerCards[0]) and \(game.player.playerCards[1])")
        print("Your total is \(game.player.getValueOfCards())\n")
        print("The dealer is showing a \(game.dealer.playerCards[0]) and a hidden card")
        print("The dealer's total is also hidden \(game.dealer.getValueOfCards())\n")
        while playerWillHit() {
            game.dealNextCard(to: game.player, withCardFlipped: .up)
            print("You drew a \(game.player.playerCards.last!)")
            print("Your total is \(game.playerTotal)")
            if game.playerHasBusted {break}
        }

        print("\nNow it's the dealer's turn.\n")
        game.dealer.playerCards[1].flipCard()
        print("Delaer flips over his hidden card and it's a \(game.dealer.playerCards[1])")
        print("The dealer's total is \(game.dealerTotal)\n")
        while dealerWillHit() {
            game.dealNextCard(to: game.dealer, withCardFlipped: .up)
            print("The dealer drew a \(game.dealer.playerCards.last!)")
            print("The dealer's total is \(game.dealerTotal)")
        }
    }
    
    private func playerWillHit() -> Bool {
        print("Would you like to \"\(BlackjackGamePlayerHandAction.hit)\" or \"\(BlackjackGamePlayerHandAction.stand)\"?")
        game.player.playerHandAction = BlackjackGamePlayerHandAction(rawValue: readLine()!.lowercased())
        while (game.player.playerHandAction == nil) {
            print("You did not provide a valid response")
            print("Please enter \"\(BlackjackGamePlayerHandAction.hit)\" or \"\(BlackjackGamePlayerHandAction.stand)\"")
            game.player.playerHandAction = BlackjackGamePlayerHandAction(rawValue: readLine()!)
        }
        return game.player.playerHandAction == .hit
    }
    
    private func dealerWillHit() -> Bool {
        return false
    }
}

extension String {
    func equalsToIgnoreCase(string : String) -> Bool {
        return self.caseInsensitiveCompare(string) == .orderedSame
    }
}
