//
//  API.swift
//  Characters
//
//  Created by Ryan Haycock on 25/02/2023.
//

import Foundation

struct API {
    let baseURL: URL
}

// MARK: - Available APIs

extension API {
    static let rickAndMortyAPI = API(
        baseURL: URL(string: "https://rickandmortyapi.com")!
    )
}
