//
//  MockNetworkRouter.swift
//  CharactersTests
//
//  Created by Ryan Haycock on 27/02/2023.
//

import Foundation
@testable import Characters
import XCTest

final class MockNetworkRouter: NetworkRouter {
    
    var responseData: Data?
    var requestCount = 0
}

// MARK: - Preparing For Testing

extension MockNetworkRouter {
    func setResponseData(_ data: Data) {
        self.responseData = data
    }
}

// MARK: - Send

extension MockNetworkRouter {
    func send<Response>(request: URLRequest) async throws -> Response where Response: Decodable {
        requestCount += 1
        guard let responseData = self.responseData else {
            XCTFail("No response data provided")
            throw Error.noResponseDataProvided
        }
        let response = try JSONDecoder().decode(Response.self, from: responseData)
        return response
    }
}

// MARK: - Errors

extension MockNetworkRouter {
    enum Error: Swift.Error {
        case noResponseDataProvided
    }
}
