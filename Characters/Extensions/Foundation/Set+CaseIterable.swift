//
//  Set+CaseIterable.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import Foundation

public extension Set where Element: CaseIterable {
    static var all: Set<Element> { return Set(Element.allCases) }
}
