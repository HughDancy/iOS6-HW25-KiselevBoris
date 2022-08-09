//
//  ViewController.swift
//  iOS6-HW25-KiselevBoris
//
//  Created by Борис Киселев on 03.08.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var table = UITableView()
    var cards: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCards()
//        fetchData()
        view.addSubview(table)
        table.register(MagicCell.self, forCellReuseIdentifier: "Magic Cell")
        table.delegate = self
        table.dataSource = self
        
        setupLayout()
        // Do any additional setup after loading the view.
    }

//    func fetchData() {
//        let request = AF.request("https://api.magicthegathering.io/v1/cards")
//        request.responseJSON { (data) in
//            print(data)
//        }
//    }
    
    func fetchCards() {
        let request = AF.request("https://api.magicthegathering.io/v1/cards")
        request.responseDecodable(of: Cards.self) { (data) in
            print(data)
            guard let card = data.value else { return }
            let cardss = card.cards
            print(data)
            self.cards = cardss
            
            self.table.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Magic Cell", for: indexPath) as! MagicCell
        for card in cards {
            cell.cardo = card
        }
        
        return cell
    }

    func setupLayout() {
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 3).isActive = true
        table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 3).isActive = true
        table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -3).isActive = true
    }
}

