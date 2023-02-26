//
//  Endpoint.swift
//  Characters
//
//  Created by Ryan Haycock on 25/02/2023.
//

import Foundation

struct Endpoint {
    let api: API
    let uriString: String
}

// MARK: - Convenience

extension Endpoint {
    var url: URL? {
        return URL(string: uriString, relativeTo: api.baseURL)
    }
}
