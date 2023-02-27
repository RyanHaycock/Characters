//
//  TestData+Characters.swift
//  CharactersTests
//
//  Created by Ryan Haycock on 27/02/2023.
//

@testable import Characters

extension TestData {
    struct Characters {
        static let rick = Character(
            name: "Rick Sanchez",
            species: "Human",
            gender: "Male",
            imageURLString: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
        )
        
        static let morty = Character(
            name: "Morty Smith",
            species: "Human",
            gender: "Male",
            imageURLString: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"
        )
        
        static let summer = Character(
            name: "Summer Smith",
            species: "Human",
            gender: "Female",
            imageURLString: "https://rickandmortyapi.com/api/character/avatar/3.jpeg"
        )
    }
}
