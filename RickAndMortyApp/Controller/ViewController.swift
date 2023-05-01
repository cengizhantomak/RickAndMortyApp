//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by Cengizhan Tomak on 27.04.2023.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var locationCollectionView: UICollectionView!
    @IBOutlet weak var charactersTableView: UITableView!
    
    private let viewModel = CharacterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationCollectionView.delegate = self
        locationCollectionView.dataSource = self
        
        charactersTableView.delegate = self
        charactersTableView.dataSource = self
        charactersTableView.separatorStyle = .none
        
        viewModel.fetchLocations {
            DispatchQueue.main.async {
                self.locationCollectionView.reloadData()
                self.selectFirstCell()
            }
        }
        
        let logo = UIImage(named: "rickAndMortyText")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.locationList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = locationCollectionView.dequeueReusableCell(withReuseIdentifier: "locationCell", for: indexPath) as! LocationCollectionViewCell
        cell.locationLabel.text = viewModel.locationList[indexPath.row].name
        cell.locationView.layer.cornerRadius = 10
        cell.locationView.layer.borderWidth = 2
        cell.locationView.layer.borderColor = UIColor.darkGray.cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedResidents = viewModel.locationList[indexPath.row].residents
        let ids = selectedResidents.compactMap { URL(string: $0)?.lastPathComponent }.joined(separator: ",")
        
        if !ids.isEmpty {
            viewModel.fetchCharacters(ids: ids) {
                DispatchQueue.main.async {
                    self.charactersTableView.reloadData()
                }
            }
        } else {
            viewModel.characterList = []
            charactersTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row % 2 == 0) {
            let cell = charactersTableView.dequeueReusableCell(withIdentifier: "character1Cell") as! LocationTableViewCell
            
            cell.label1.text = viewModel.characterList[indexPath.row].name
            
            let urlString = viewModel.characterList[indexPath.row].image
            let activityIndicator = viewModel.createActivityIndicator(for: cell.image1)
            viewModel.loadImage(urlString: urlString) { image in
                DispatchQueue.main.async {
                    if let image = image {
                        cell.image1.image = image
                        cell.image1.layer.cornerRadius = 10
                    }
                    activityIndicator.stopAnimating()
                }
            }
            
            if viewModel.characterList[indexPath.row].gender == "Male" {
                cell.genderImage1.image = UIImage(named: "male")
            } else if viewModel.characterList[indexPath.row].gender == "Female" {
                cell.genderImage1.image = UIImage(named: "female")
            } else {
                cell.genderImage1.image = UIImage(named: "unknown")
            }
            
            cell.view1.layer.cornerRadius = 10
            cell.view1.layer.borderWidth = 2
            cell.view1.layer.borderColor = UIColor.darkGray.cgColor
            
            return cell
            
        } else {
            let cell = charactersTableView.dequeueReusableCell(withIdentifier: "character2Cell") as! LocationTableViewCell
            
            cell.label2.text = viewModel.characterList[indexPath.row].name
            
            let urlString = viewModel.characterList[indexPath.row].image
            let activityIndicator = viewModel.createActivityIndicator(for: cell.image2)
            viewModel.loadImage(urlString: urlString) { image in
                DispatchQueue.main.async {
                    if let image = image {
                        cell.image2.image = image
                        cell.image2.layer.cornerRadius = 10
                    }
                    activityIndicator.stopAnimating()
                }
            }
            
            if viewModel.characterList[indexPath.row].gender == "Male" {
                cell.genderImage2.image = UIImage(named: "male")
            } else if viewModel.characterList[indexPath.row].gender == "Female" {
                cell.genderImage2.image = UIImage(named: "female")
            } else {
                cell.genderImage2.image = UIImage(named: "unknown")
            }
            
            cell.view2.layer.cornerRadius = 10
            cell.view2.layer.borderWidth = 2
            cell.view2.layer.borderColor = UIColor.darkGray.cgColor
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetailVC", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let index = sender as? Int
        
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.character = viewModel.characterList[index!]
        }
    }
    
    func selectFirstCell() {
        let firstIndexPath = IndexPath(item: 0, section: 0)
        locationCollectionView.selectItem(at: firstIndexPath, animated: false, scrollPosition: .top)
        collectionView(locationCollectionView, didSelectItemAt: firstIndexPath)
    }
}
