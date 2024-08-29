//
//  ViewController.swift
//  iOS6-HW25-KiselevBoris
//
//  Created by Борис Киселев on 03.08.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    // MARK: - Subview's
    var magicUrl = "https://api.magicthegathering.io/v1/cards"
    var table = UITableView(frame: .zero, style: UITableView.Style.insetGrouped)
    var searchBar: UISearchBar = {
        var searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        searchBar.barTintColor = UIColor(displayP3Red: 0.96, green: 0.96, blue: 0.98, alpha: 1)
        return searchBar
    }()

    lazy var searchButton: UIButton = {
        var searchButton = UIButton()
        searchButton.addTarget(self, action: #selector(tapButton), for: .touchDown)

        return searchButton
    }()

    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.color = .systemBlue
        indicator.isHidden = !cards.isEmpty
        indicator.startAnimating()
        return indicator
    }()

    var cards: [Card] = [] {
        didSet {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }

    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Setup View
    private func setupView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        title = "MTG Random Cards"
        fetchCards()
        setupHierarchy()
        configurateButton()
        configurateTable()
        setupLayout()
    }

    // MARK: - Settings
    func setupHierarchy() {
        view.backgroundColor = UIColor(displayP3Red: 0.96, green: 0.96, blue: 0.98, alpha: 1)
        view.addSubview(table)
        view.addSubview(searchBar)
        view.addSubview(searchButton)
        view.addSubview(activityIndicator)
    }

    func configurateTable() {
        table.register(MagicCell.self, forCellReuseIdentifier: "Magic Cell")
        table.delegate = self
        table.dataSource = self
    }

    func configurateButton() {
        searchButton.configuration = .tinted()
        searchButton.configuration?.title = "Search"
    }

    // MARK: - Fetch Cards
    func fetchCards() {
        let request = AF.request(magicUrl)
        request.responseDecodable(of: Cards.self) { data in
            guard let char = data.value else { return }
            let downloadedCards = char.cards
            self.cards = downloadedCards
            self.table.reloadData()
        }
    }

    // MARK: - Button Action
    @objc private func tapButton() {
        if searchBar.text?.isEmpty == false {
            magicUrl = "https://api.magicthegathering.io/v1/cards?name=\(searchBar.text ?? "")"
            DispatchQueue.main.async {
                self.fetchCards()
            }
            showAlert()
        } else {
            magicUrl = "https://api.magicthegathering.io/v1/cards"
            fetchCards()
        }
    }

    func showAlert() {
        if cards.isEmpty == true {
            let allertController = UIAlertController(title: "Error", message: "Not found requested card. Please try again.", preferredStyle: .alert)
            let allertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            allertController.addAction(allertAction)

            present(allertController, animated: true, completion: nil)
        }
    }

    // MARK: - Setup Layout
    func setupLayout() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 13).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -150).isActive = true

        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13).isActive = true
        searchButton.leadingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: 5).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -19).isActive = true

        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10).isActive = true
        table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
}

// MARK: - Table Extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Magic Cell", for: indexPath) as? MagicCell else {
            return UITableViewCell()
        }
        cell.cards = cards[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewContoller = InformationViewController()
        viewContoller.view.backgroundColor = .white
        viewContoller.cards = cards[indexPath.row]
        present(viewContoller, animated: true)
    }
}

