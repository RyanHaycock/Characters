//
//  UIEdgeInsets+Convenience_Tests.swift
//  CharactersTests
//
//  Created by Ryan Haycock on 27/02/2023.
//

import XCTest
@testable import Characters

final class UIEdgeInsets_Convenience_Tests: XCTestCase {
    func test_init_withAll_initialisesCorrectly() {
        let edgeInsets = UIEdgeInsets(all: 8)
        
        XCTAssertEqual(edgeInsets.top, 8, "Insets set incorrectly")
        XCTAssertEqual(edgeInsets.bottom, 8, "Insets set incorrectly")
        XCTAssertEqual(edgeInsets.left, 8, "Insets set incorrectly")
        XCTAssertEqual(edgeInsets.right, 8, "Insets set incorrectly")
    }
    
    func test_init_withHorizontalAndVerticalValues_initialisesCorrectly() {
        let edgeInsets = UIEdgeInsets(horizontal: 6, vertical: 12)
        
        XCTAssertEqual(edgeInsets.top, 12, "Insets set incorrectly")
        XCTAssertEqual(edgeInsets.bottom, 12, "Insets set incorrectly")
        XCTAssertEqual(edgeInsets.left, 6, "Insets set incorrectly")
        XCTAssertEqual(edgeInsets.right, 6, "Insets set incorrectly")
    }
    
    func test_init_withAllValues_initialisesCorrectly() {
        let edgeInsets = UIEdgeInsets(top: 1, bottom: 2, left: 3, right: 4)
        
        XCTAssertEqual(edgeInsets.top, 1, "Insets set incorrectly")
        XCTAssertEqual(edgeInsets.bottom, 2, "Insets set incorrectly")
        XCTAssertEqual(edgeInsets.left, 3, "Insets set incorrectly")
        XCTAssertEqual(edgeInsets.right, 4, "Insets set incorrectly")
    }
}
