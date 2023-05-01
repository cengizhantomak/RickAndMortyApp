//
//  DetailViewController.swift
//  RickAndMortyApp
//
//  Created by Cengizhan Tomak on 30.04.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var specyLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var episodesLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    
    private let viewModel = CharacterViewModel()
    
    var character: Character?
    var imageCache: [String: UIImage] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = character?.image
        let activityIndicator = viewModel.createActivityIndicator(for: image)
        viewModel.loadImage(urlString: urlString!) { image in
            DispatchQueue.main.async {
                if let image = image {
                    self.image.image = image
                }
                activityIndicator.stopAnimating()
            }
        }

        statusLabel.text = character?.status
        specyLabel.text = character?.species
        genderLabel.text = character?.gender
        originLabel.text = character?.origin.name
        locationLabel.text = character?.location.name
        createdLabel.text = character?.created
        
        let selectedEpisode = character?.episode
        let episodeNumber = selectedEpisode!.compactMap { URL(string: $0)?.lastPathComponent }.joined(separator: ",")
        
        episodesLabel.text = episodeNumber
        
        let dateString = character?.created
        
        createdLabel.text = viewModel.formatDate(dateString: dateString!)
        
        self.navigationItem.title = character?.name
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Avenir-Black", size: 16)!]
    }
}
