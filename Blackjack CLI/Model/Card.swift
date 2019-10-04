//
//  card.swift
//  Blackjack CLI
//
//  Created by Matthew Johnson on 3/18/19.
//  Copyright © 2019 Matthew Johnson. All rights reserved.
//

import Foundation
class Card {
    private(set) var isFaceUp: Bool?

    public func flipCard() {
        if let isFaceUp = self.isFaceUp {
            self.isFaceUp = !isFaceUp
        }
    }

    public func setFace(_ cardOrientation: CardFaceOrientation) {
        isFaceUp = cardOrientation == .up
    }
}

enum CardFaceOrientation {
    case up, down
}
