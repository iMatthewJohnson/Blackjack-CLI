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
        print("Welcome to Blackjack. Press ENTER when you're reading to begin")
        _ = readLine()
        print("You were dealt a \(game.playerCards[0]) and \(game.playerCards[1])")
        print("Your total is \(game.playerTotal)\n")
        print("The dealer is showing a \(game.dealerCards[0]) and a hidden card")
        print("The dealer's total is also hidden\n")
        while playerWillHit() {
            game.dealNextCardToPlayer()
            print("You drew a \(game.playerCards.last!)")
            print("Your total is \(game.playerTotal)")
            if game.playerHasBusted {break}
        }
        print("\nNow it's the dealer's turn.\n")
        print("Delaer flips over his hidden card and it's a \(game.dealerCards[1])")
        print("The dealer's total is \(game.dealerTotal)\n")
        while dealerWillHit() {
            game.dealNextCardToDealer()
            print("The dealer drew a \(game.dealerCards.last!)")
            print("The dealer's total is \(game.dealerTotal)")
            
            
        }
    }
    
    private func playerWillHit() -> Bool {
        let hitPhrase = "hit"
        let standPhrase = "stand"
        print("Would you like to \"\(hitPhrase)\" or \"\(standPhrase)\"?")
        var response = readLine()!
        while 
        !(response.equalsToIgnoreCase(string: hitPhrase)) && !(response.equalsToIgnoreCase(string: standPhrase))
        {
            print("You did not provide a valid response")
            print("Please enter \"\(hitPhrase)\" or \"\(standPhrase)\"")
            response = readLine()!
        }
        return response.equalsToIgnoreCase(string: hitPhrase)
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
