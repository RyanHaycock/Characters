//
//  Character.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import Foundation

struct Character: Codable, Equatable {
    let name: String
    let species: String
    let gender: String
    let imageURLString: String
}

// MARK: - Coding Keys

extension Character {
    enum CodingKeys: String, CodingKey {
        case name, species, gender
        case imageURLString = "image"
    }
}
