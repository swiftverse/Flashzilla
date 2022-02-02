//
//  Card.swift
//  Flashzilla
//
//  Created by Amit Shrivastava on 28/01/22.
//

import Foundation

struct Card: Codable, Identifiable, Hashable {
    let prompt: String
    let answer: String
    var id = UUID()
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        lhs.id == rhs.id
    }
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
