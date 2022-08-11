//
//  Model.swift
//  iOS6-HW25-KiselevBoris
//
//  Created by Борис Киселев on 03.08.2022.
//

import Foundation

struct Cards: Decodable {
    var cards: [Card]
}

struct Card: Decodable {
    var name: String?
    var manaCost: String?
//    var colors: [Colors]
    var type: String?
    var rarity: String?
    var multiverseid: Int?
//    var set: String
//    var text: String
    var imageUrl: String?
  
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=148412&type=card"
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
