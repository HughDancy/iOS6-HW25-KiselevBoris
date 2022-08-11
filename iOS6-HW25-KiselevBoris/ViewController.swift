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
    let simple = "hamachi_url"
    
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
//        var content = cell.defaultContentConfiguration()
//        content.text = cards[indexPath.row].name
//        content.secondaryText = cards[indexPath.row].type
//        print(cards[indexPath.row].multiverseid)
////        print(cards[indexPath.row].imageUrl)
//        content.image = getImage(url: cards[indexPath.row].imageUrl ?? "image_url")
//        cell.contentConfiguration = content

        
        return cell
    }
    
    func getImage(url: String) -> UIImage? {
        if let imageUrl = URL(string: url),
           let imageData = try? Data(contentsOf: imageUrl) {
            return UIImage(data: imageData)
        } else {
            return UIImage(named: "black_brick")
        }
    }

    func setupLayout() {
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1).isActive = true
        table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 3).isActive = true
        table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -1).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -1).isActive = true
    }
}

