//
//  MainCharacterService_Tests.swift
//  CharactersTests
//
//  Created by Ryan Haycock on 27/02/2023.
//

import XCTest
@testable import Characters

final class MainCharacterService_Tests: XCTestCase {
    
    var mockNetworkRouter: MockNetworkRouter!
    var sut: CharacterService!
    
    override func setUpWithError() throws {
        let networkRouter = MockNetworkRouter()
        self.mockNetworkRouter = networkRouter
        sut = MainCharacterService(networkRouter: networkRouter)
    }
    
    override func tearDownWithError() throws {
        mockNetworkRouter = nil
        sut = nil
    }
}

// MARK: - Test Fetch Characters

extension MainCharacterService_Tests {
    func test_characterService_whenFetchingCharacters_onlyTriggersOneSendRequest() throws {
        verifyRequestCountIsZero()
        let expectation = expectation(description: "Send Request")
        let characterResponse = try givenCharacterResponse()
        mockNetworkRouter.setResponseData(characterResponse)
        
        sut.fetchCharacters { _ in
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1)
        verifyRequestCountIsOne()
    }
    
    func test_characterService_whenFetchingCharacters_decodesResponseSuccessfully() throws {
        verifyRequestCountIsZero()
        let expectation = expectation(description: "Send Request")
        let characterResponse = try givenCharacterResponse()
        mockNetworkRouter.setResponseData(characterResponse)
        var characters: [Character]?
        
        sut.fetchCharacters { result in
            switch result {
            case .success(let chars):
                characters = chars
                
            case .failure:
                XCTFail("Response and decoding should succeed")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1)
        XCTAssertEqual(
            characters,
            [TestData.Characters.rick, TestData.Characters.morty, TestData.Characters.summer],
            "Characters should decode successfully"
        )
    }
    
    func test_characterService_whenFetchingCharactersAndReceivesBadData_failsGracefully() throws {
        verifyRequestCountIsZero()
        let expectation = expectation(description: "Send Request")
        let malformedResponse = try givenMalformedCharacterResponse()
        mockNetworkRouter.setResponseData(malformedResponse)

        sut.fetchCharacters { result in
            switch result {
            case .success:
                XCTFail("Decoding should fail")
                
            case .failure:
                break
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }
}

// MARK: - Given Helpers

extension MainCharacterService_Tests {
    private func givenCharacterResponse() throws -> Data {
        let bundle = Bundle(for: type(of: self))

        guard let url = bundle.url(forResource: "CharacterResponse", withExtension: "json") else {
            XCTFail("Missing file for CharacterResponse.json")
            return Data()
        }
        return try Data(contentsOf: url)
    }
    
    private func givenMalformedCharacterResponse() throws -> Data {
        let bundle = Bundle(for: type(of: self))

        guard let url = bundle.url(forResource: "MalformedCharacterResponse", withExtension: "json") else {
            XCTFail("Missing file for MalformedCharacterResponse.json")
            return Data()
        }
        return try Data(contentsOf: url)
    }
}

// MARK: - Verify Helpers

extension MainCharacterService_Tests {
    private func verifyRequestCountIsZero() {
        XCTAssertEqual(mockNetworkRouter.requestCount, 0, "No requests should have been made yet")
    }
    
    private func verifyRequestCountIsOne() {
        XCTAssertEqual(mockNetworkRouter.requestCount, 1, "Exactly one request should have taken place")
    }
}
