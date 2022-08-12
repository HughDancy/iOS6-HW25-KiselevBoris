//
//  ViewController.swift
//  iOS6-HW25-KiselevBoris
//
//  Created by Борис Киселев on 03.08.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var table = UITableView(frame: .zero, style: UITableView.Style.insetGrouped)
    var cards: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCards()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        title = "MTG Random Cards"
        view.backgroundColor = UIColor(displayP3Red: 0.96, green: 0.96, blue: 0.98, alpha: 1)
        view.addSubview(table)
        table.register(MagicCell.self, forCellReuseIdentifier: "Magic Cell")
        table.delegate = self
        table.dataSource = self
       
        setupLayout()
    }
    
    func fetchCards() {
        let request = AF.request("https://api.magicthegathering.io/v1/cards")
        request.responseDecodable(of: Cards.self) { data in
            guard let char = data.value else {
                print("no data")
                return
            }
            let cardss = char.cards
            self.cards = cardss
            
            self.table.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 65
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Magic Cell", for: indexPath) as! MagicCell
        cell.cards = cards[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewC = InformationViewController()
        viewC.view.backgroundColor = .white
        viewC.cards = cards[indexPath.row]
        
        navigationController?.pushViewController(viewC, animated: true)
    }
    
    func setupLayout() {
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

