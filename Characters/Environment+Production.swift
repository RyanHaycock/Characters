//
//  Environment+Production.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import Foundation

extension Environment {
    static let productionEnvironment = Environment(
        characterService: MainCharacterService(),
        imageService: MainImageService(),
        logManager: MainLogManager()
    )
}
