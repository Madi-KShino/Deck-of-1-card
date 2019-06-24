//
//  Cards.swift
//  DeckOfOneCard
//
//  Created by Madison Kaori Shino on 6/24/19.
//  Copyright © 2019 Madi S. All rights reserved.
//
import Foundation

struct TopLevelJSON: Codable {
    let cards: [Card]
}

class Card: Codable {
    
    let suit: String
    let value: String
    let code: String
    let image: String
    
    init(suit: String, value: String, code: String, image: String) {
        self.suit = suit
        self.value = value
        self.code = code
        self.image = image
    }
}
