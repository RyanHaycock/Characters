//
//  Network Error.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import Foundation

enum NetworkError: Error {
    case serverError(HTTPStatusCode)
    case unknownServerError(Error?)
    case urlSessionError(Error)
    case decodingError(Error)
}
