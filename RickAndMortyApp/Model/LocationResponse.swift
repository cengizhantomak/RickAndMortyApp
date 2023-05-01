//
//  Location.swift
//  RickAndMortyApp
//
//  Created by Cengizhan Tomak on 27.04.2023.
//

import Foundation

struct LocationResponse: Codable {
    let results: [Results]
}

struct Results: Codable {
    let name: String
    let residents: [String]
}
