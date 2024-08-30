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

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.color = .systemBlue
        indicator.isHidden = false
        indicator.startAnimating()
        return indicator
    }()

    var data: Card? {
        didSet {
            nameOfCard.text = "\(data?.name ?? "")"
            typeOfCard.text = "\(data?.type ?? "")"
            manaCost.text = "Mana cost:  \(data?.manaCost ?? "")"
            rarity.text = "Rarity:  \(data?.rarity ?? "")"
            set.text = "Set:  \(data?.set ?? "")"
            text.text = "Description:  \(data?.text ?? "")"
            artist.text = "Art artist:  \(data?.artist ?? "")"
            guard let cardUrl = data?.imageUrl,
                  let imageUrl = URL(string: cardUrl) else {
                self.imageOfCard.image = UIImage(named: "MagicBack")
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                return
            }

            AF.request(imageUrl).response { response in
                switch response.result {
                case .success(let data):
                    self.imageOfCard.image = UIImage(data: data!)
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                case .failure(_):
                    self.imageOfCard.image = UIImage(named: "MagicBack")
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
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
        view.addSubview(activityIndicator)
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

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: imageOfCard.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: imageOfCard.centerYAnchor).isActive = true
    }
}
