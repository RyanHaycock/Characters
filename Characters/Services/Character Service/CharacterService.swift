//
//  CharacterService.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import Foundation

protocol CharacterService {
    typealias Result = Swift.Result<[Character], CharacterServiceError>
    
    func fetchCharacters(completion: @escaping (Result) -> Void)
}

// MARK: - Implementation

final class MainCharacterService: CharacterService {
    
    let networkRouter: NetworkRouter
    
    let charactersEndpoint = Endpoint(
        api: .rickAndMortyAPI,
        uriString: "/api/character"
    )
    
    init(networkRouter: NetworkRouter = MainNetworkRouter()) {
        self.networkRouter = networkRouter
    }
}

// MARK: - Fetch Characters

extension MainCharacterService {
    func fetchCharacters(completion: @escaping (CharacterService.Result) -> Void) {
        guard let url = charactersEndpoint.url else {
            assertionFailure("Invalid URL")
            return completion(.failure(.invalidURL))
        }
        
        Task {
            let result: CharacterService.Result
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            
            do {
                let request = URLRequest(url: url)
                let dataWrapper: Wrapper<[Character]> = try await networkRouter.send(request: request)
                result = .success(dataWrapper.results)
                
            } catch let error as NetworkError { 
                result = .failure(.networkError(error))
                
            } catch let error {
                result = .failure(.unknownError(error))
            }
        }
    }
}

// MARK: - Wrapper

fileprivate struct Wrapper<T>: Codable where T: Codable {
    let results: T
}
