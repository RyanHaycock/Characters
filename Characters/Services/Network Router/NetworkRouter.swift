//
//  NetworkRouter.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import Foundation

protocol NetworkRouter {
    func send<Response: Decodable>(request: URLRequest) async throws -> Response
}
