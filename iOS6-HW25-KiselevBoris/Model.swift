//
//  Model.swift
//  iOS6-HW25-KiselevBoris
//
//  Created by Борис Киселев on 03.08.2022.
//

import Foundation

struct Cards: Decodable, Hashable {
    var cards: [Card]
}

struct Card: Decodable, Hashable {
    var name: String?
    var manaCost: String?
    var type: String?
    var rarity: String?
    var set: String?
    var text: String?
    var artist: String?
    var imageUrl: String?

    enum CodingKeys: String, CodingKey {
        case name
        case manaCost
        case type
        case rarity
        case set
        case text
        case artist
        case imageUrl
    }
}


