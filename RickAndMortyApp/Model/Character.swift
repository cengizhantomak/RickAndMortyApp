//
//  Character.swift
//  RickAndMortyApp
//
//  Created by Cengizhan Tomak on 30.04.2023.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let image: String
    let status: String
    let species: String
    let gender: String
    let origin: Origin
    let location: Location
    let episode: [String]
    let created: String
}

struct Origin: Codable {
    let name: String
}

struct Location: Codable {
    let name: String
}
