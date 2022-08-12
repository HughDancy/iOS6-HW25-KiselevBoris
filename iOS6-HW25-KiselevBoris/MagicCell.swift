//
//  MagicCell.swift
//  iOS6-HW25-KiselevBoris
//
//  Created by Борис Киселев on 04.08.2022.
//

import Foundation
import UIKit

class MagicCell: UITableViewCell {
    // MARK: - Subviews
    
    static let reuseID = "Magic Cell"
    
    private var nameOfCard = UILabel()
    private var typeOfCard = UILabel()
    
    var cards: Card? {
        didSet {
            nameOfCard.text = cards?.name
            typeOfCard.text = cards?.type
        }
    }
    
    // MARK: - Init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: MagicCell.reuseID)
        contentView.addSubview(nameOfCard)
        contentView.addSubview(typeOfCard)
        
        nameOfCard.translatesAutoresizingMaskIntoConstraints = false
        nameOfCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3).isActive = true
        nameOfCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3).isActive = true
        nameOfCard.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        typeOfCard.translatesAutoresizingMaskIntoConstraints = false
        typeOfCard.topAnchor.constraint(equalTo: nameOfCard.bottomAnchor, constant: 3).isActive = true
        typeOfCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3).isActive = true
        
    }
}
