//
//  CharacterViewModel.swift
//  RickAndMortyApp
//
//  Created by Cengizhan Tomak on 30.04.2023.
//

import Foundation
import UIKit

class CharacterViewModel {
    var characterList: [Character] = []
    var locationList: [Results] = []
    var imageCache: [String: UIImage] = [:]

    func fetchLocations(completion: @escaping () -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/location") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let locationsData = try decoder.decode(LocationResponse.self, from: data)
                    self.locationList = locationsData.results
                    completion()
                } catch {
                    print("Error decoding data: \(error.localizedDescription)")
                }
            }
        }.resume()
    }

    func fetchCharacters(ids: String, completion: @escaping () -> Void) {
        if let url = URL(string: "https://rickandmortyapi.com/api/character/\(ids)") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let charactersData = try decoder.decode([Character].self, from: data)
                        self.characterList = charactersData
                        completion()
                    } catch {
                        do {
                            let decoder = JSONDecoder()
                            let charactersData = try decoder.decode(Character.self, from: data)
                            self.characterList = [charactersData]
                            completion()
                        } catch {
                            print("Error decoding data: \(error.localizedDescription)")
                        }
                    }
                }
            }.resume()
        }
    }

    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = imageCache[urlString] {
            completion(cachedImage)
        } else {
            URLSession.shared.dataTask(with: URL(string: urlString)!) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    completion(nil)
                    return
                }
                
                DispatchQueue.main.async {
                    if let image = UIImage(data: data!) {
                        self.imageCache[urlString] = image
                        completion(image)
                    } else {
                        completion(nil)
                    }
                }
                
            }.resume()
        }
    }
    
    func createActivityIndicator(for imageView: UIImageView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.startAnimating()
        imageView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
        ])
        return activityIndicator
    }
    
    func formatDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = "d MMMM yyyy, HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: date!)
    }
    
}


