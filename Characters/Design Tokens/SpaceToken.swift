//
//  SpaceToken.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import CoreGraphics

enum SpaceToken: CGFloat {
    case minorPadding = 4
    case mediumPadding = 8
    case padding = 16
}

// MARK: - CGFloat Convenience

extension CGFloat {
    /// Provides a spacing value as defined by the space token.
    static func spacingToken(_ spaceToken: SpaceToken) -> CGFloat {
        return spaceToken.rawValue
    }
}
