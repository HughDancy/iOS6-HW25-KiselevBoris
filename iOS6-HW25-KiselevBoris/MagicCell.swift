//
//  MagicCell.swift
//  iOS6-HW25-KiselevBoris
//
//  Created by Борис Киселев on 04.08.2022.
//

import Foundation
import UIKit

class MagicCell: UITableViewCell {
    
    static let reuseID = "Magic Cell"
    
    private var nameOfCard = UILabel()
    private var manaCost = UILabel()
    private var imageOfCard = UIImageView()
    
    var cards: Card? {
        didSet {
            nameOfCard.text = cards?.name
            manaCost.text = cards?.manaCost
            
            guard let imageUrl = cards?.imageUrl,
                  let url = URL(string: imageUrl),
                  let imageData = try? Data(contentsOf: url)
            else {
                imageOfCard.image = UIImage(named: "square-image")
                return
            }
            imageOfCard.image = UIImage(data: imageData)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: MagicCell.reuseID)
        contentView.addSubview(nameOfCard)
        contentView.addSubview(imageOfCard)
        contentView.addSubview(manaCost)
        
        nameOfCard.translatesAutoresizingMaskIntoConstraints = false
        nameOfCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3).isActive = true
        nameOfCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3).isActive = true
        nameOfCard.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        manaCost.translatesAutoresizingMaskIntoConstraints = false
        manaCost.topAnchor.constraint(equalTo: nameOfCard.bottomAnchor, constant: 3).isActive = true
        manaCost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3).isActive = true
        
        
        imageOfCard.translatesAutoresizingMaskIntoConstraints = false
        imageOfCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        imageOfCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3).isActive = true
        imageOfCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3).isActive = true
        
        
     }
}
