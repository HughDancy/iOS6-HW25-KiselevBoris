//
//  InformationViewController.swift
//  iOS6-HW25-KiselevBoris
//
//  Created by Борис Киселев on 11.08.2022.
//

import UIKit

class InformationViewController: UIViewController {

    var nameOfCard: UILabel = {
        let nameOfCard = UILabel()
        nameOfCard.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupLayout()
        // Do any additional setup after loading the view.
    }
    
    func addSubViews() {
        view.addSubview(nameOfCard)
        view.addSubview(typeOfCard)
        view.addSubview(manaCost)
        view.addSubview(rarity)
        view.addSubview(set)
        view.addSubview(text)
        view.addSubview(artist)
    }
    
    func setupLayout() {
        nameOfCard.translatesAutoresizingMaskIntoConstraints = false
        nameOfCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        nameOfCard.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        
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
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
