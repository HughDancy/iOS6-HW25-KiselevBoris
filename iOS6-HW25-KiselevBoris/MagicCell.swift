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
    
    var Card: Card? {
        didSet {
            nameOfCard.text = Card?.name
            typeOfCard.text = Card?.type
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
        nameOfCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9).isActive = true
        nameOfCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        nameOfCard.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        typeOfCard.translatesAutoresizingMaskIntoConstraints = false
        typeOfCard.topAnchor.constraint(equalTo: nameOfCard.bottomAnchor, constant: 3).isActive = true
        typeOfCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        typeOfCard.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -9).isActive = true
    }
}
