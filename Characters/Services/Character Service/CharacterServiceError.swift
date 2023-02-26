//
//  CharacterServiceError.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import Foundation

enum CharacterServiceError: Error {
    case invalidURL
    case networkError(NetworkError)
    case unknownError(Swift.Error?)
}
