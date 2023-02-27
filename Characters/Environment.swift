//
//  Environment.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import Foundation

var Env: Environment!

struct Environment {
    let characterService: CharacterService
    let imageService: ImageService
    
    let logManager: LogManager
}
