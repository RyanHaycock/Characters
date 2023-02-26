//
//  CharacterCell+ViewModel.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import Foundation

extension CharacterCell {
    struct ViewModel: Equatable {
        let name: String
        let species: String
        let gender: String
        let imageURL: URL?
        
        init(character: Character) {
            self.name = character.name
            self.species = character.species
            self.gender = character.gender
            self.imageURL = character.imageURLString.asURL
        }
    }
}
