//
//  ColorToken.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import UIKit

enum ColorToken {
    case primaryColour
    case backgroundColour
    case tintColour
    case missingImageColour
    
    case primaryTextColour
    case secondaryTextColour
    case inverseTextColour
}

// MARK: - Hex Value

extension ColorToken {
    var hexValue: Hex {
        switch self {
        case .primaryColour: return 0x240046
        case .backgroundColour: return 0x10002b
        case .tintColour: return 0x3c096c
        case .missingImageColour: return 0xE5E5EA
        
        case .primaryTextColour: return 0xFFFFFF
        case .secondaryTextColour: return 0xFFFFFF
        case .inverseTextColour: return 0x000000
        }
    }
}

// MARK: - CGColor Convenience

extension CGColor {
    /// Provides a color as defined by the color token.
    static func palette(_ colorToken: ColorToken, opacity: CGFloat = 1) -> CGColor {
        return UIColor(hex: colorToken.hexValue, alpha: opacity).cgColor
    }
}

// MARK: - UIColor Convenience

extension UIColor {
    /// Provides a color as defined by the color token.
    static func palette(_ colorToken: ColorToken, opacity: CGFloat = 1) -> UIColor {
        return UIColor(hex: colorToken.hexValue, alpha: opacity)
    }
}
