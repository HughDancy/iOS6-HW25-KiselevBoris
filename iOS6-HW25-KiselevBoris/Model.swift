//
//  Model.swift
//  iOS6-HW25-KiselevBoris
//
//  Created by Борис Киселев on 03.08.2022.
//

import Foundation

struct Cards: Decodable {
    let cards: [Card]
}

struct Card: Decodable {
    let name: String
    let manaCost: String
//    var colors: [Colors]
    let type: String
    let rarity: String
//    var set: String
//    var text: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case name
        case manaCost
        case type
        case rarity
    }
    
}

//struct Colors: Decodable {
//    var firstColor: String
//    var secondColor: String
//    var thirdColor: String
//}
