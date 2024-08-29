//
//  InformationViewController.swift
//  iOS6-HW25-KiselevBoris
//
//  Created by Борис Киселев on 11.08.2022.
//

import UIKit
import Alamofire

class InformationViewController: UIViewController {
    
    // MARK: - Subview's
    var nameOfCard: UILabel = {
        let nameOfCard = UILabel()
        nameOfCard.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        nameOfCard.numberOfLines = 0
        
        return nameOfCard
    }()
    var typeOfCard = UILabel()
    var manaCost = UILabel()
    var rarity = UILabel()
    var set = UILabel()
    var text: UILabel = {
        let text = UILabel()
        text.numberOfLines = 0
        
        return text
    }()
    var artist = UILabel()
    var imageOfCard = UIImageView()
    
    var cards: Card? {
        didSet {
            nameOfCard.text = "Name of card:  \(cards?.name ?? "")"
            typeOfCard.text = "Type:  \(cards?.type ?? "")"
            manaCost.text = "Mana cost:  \(cards?.manaCost ?? "")"
            rarity.text = "Rarity:  \(cards?.rarity ?? "")"
            set.text = "Set:  \(cards?.set ?? "")"
            text.text = "Text:  \(cards?.text ?? "")"
            artist.text = "Artist:  \(cards?.artist ?? "")"
            guard let cardUrl = cards?.imageUrl,
                  let imageUrl = URL(string: cardUrl) else {
                self.imageOfCard.image = UIImage(named: "MagicBack")
                return
            }

            AF.request(imageUrl).response { response in
                switch response.result {
                case .success(let data):
                    self.imageOfCard.image = UIImage(data: data!)
                case .failure(let error):
                    self.imageOfCard.image = UIImage(named: "MagicBack")
                }
            }
        }
    }
    
    // MARK: - ViewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupLayout()
    }
    
    // MARK: - Settings function's
    
    func addSubViews() {
        view.addSubview(nameOfCard)
        view.addSubview(typeOfCard)
        view.addSubview(manaCost)
        view.addSubview(rarity)
        view.addSubview(set)
        view.addSubview(text)
        view.addSubview(artist)
        view.addSubview(imageOfCard)
    }
    
    // MARK: - Setup Layout
    
    func setupLayout() {
        nameOfCard.translatesAutoresizingMaskIntoConstraints = false
        nameOfCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        nameOfCard.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        nameOfCard.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
        
        typeOfCard.translatesAutoresizingMaskIntoConstraints = false
        typeOfCard.topAnchor.constraint(equalTo: nameOfCard.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        typeOfCard.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        
        manaCost.translatesAutoresizingMaskIntoConstraints = false
        manaCost.topAnchor.constraint(equalTo: typeOfCard.safeAreaLayoutGuide.bottomAnchor, constant: 3).isActive = true
        manaCost.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        
        rarity.translatesAutoresizingMaskIntoConstraints = false
        rarity.topAnchor.constraint(equalTo: manaCost.safeAreaLayoutGuide.bottomAnchor, constant: 3).isActive = true
        rarity.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        
        set.translatesAutoresizingMaskIntoConstraints = false
        set.topAnchor.constraint(equalTo: rarity.safeAreaLayoutGuide.bottomAnchor, constant: 3).isActive = true
        set.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        
        text.translatesAutoresizingMaskIntoConstraints = false
        text.topAnchor.constraint(equalTo: set.safeAreaLayoutGuide.bottomAnchor, constant: 3).isActive = true
        text.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        text.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        
        artist.translatesAutoresizingMaskIntoConstraints = false
        artist.topAnchor.constraint(equalTo: text.safeAreaLayoutGuide.bottomAnchor, constant: 3).isActive = true
        artist.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        
        imageOfCard.translatesAutoresizingMaskIntoConstraints = false
        imageOfCard.topAnchor.constraint(equalTo: artist.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        imageOfCard.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        imageOfCard.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        imageOfCard.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }
}
