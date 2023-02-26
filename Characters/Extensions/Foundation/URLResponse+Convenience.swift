//
//  URLResponse+Convenience.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import Foundation

extension URLResponse {
    var asHTTPURLResponse: HTTPURLResponse? { return self as? HTTPURLResponse }
}
