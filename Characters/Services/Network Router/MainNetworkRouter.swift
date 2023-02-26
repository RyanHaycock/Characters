//
//  MainNetworkRouter.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import Foundation

final class MainNetworkRouter: NetworkRouter {
    private let session = URLSession(configuration: .default)
}

// MARK: - Send Requests

extension MainNetworkRouter {
    func send<Response: Decodable>(request: URLRequest) async throws -> Response {
        assert(Thread.isNotMainThread, "Network requests should not be performed on the main thread")
        
        do {
            let (data, urlResponse) = try await session.data(for: request)
            try checkForError(in: urlResponse)
            let response: Response = try decode(from: data)
            return response
            
        } catch let error {
            throw error is NetworkError ? error : NetworkError.urlSessionError(error)
        }
    }
}

// MARK: - Handle Decoding

private extension MainNetworkRouter {
    private func decode<Model: Decodable>(from data: Data) throws -> Model {
        assert(Thread.isNotMainThread, "Network requests should not be performed on the main thread")
        
        do {
            let model = try JSONDecoder().decode(Model.self, from: data)
            return model
            
        } catch let error {
            throw NetworkError.decodingError(error)
        }
    }
}

// MARK: - Error Handling

private extension MainNetworkRouter {
    private func checkForError(in urlResponse: URLResponse) throws {
        guard let statusCode = urlResponse.asHTTPURLResponse?.statusCode else {
            throw NetworkError.unknownServerError(nil)
        }
        guard statusCode.isSuccess else {
            throw NetworkError.serverError(statusCode)
        }
    }
}

// MARK: - HTTPStatusCode Convenience

fileprivate extension HTTPStatusCode {
    var isSuccess: Bool {
        return self >= 200 && self < 300
    }
}
