//
//  FontToken.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import UIKit

enum FontToken: String {
    case heading = "Kanit-SemiBold"
    case subheading = "Kanit-Medium"
    
    case body = "Montserrat-Regular"
    case boldBody = "Montserrat-SemiBold"
}

// MARK: - UIFont Convenience

extension UIFont {
    /// Provides the font specified by the token as a UIFont at the given size.
    static func font(_ kind: FontToken, size sizeToken: FontSizeToken) -> UIFont {
        guard let font = UIFont(name: kind.rawValue, size: sizeToken.rawValue) else {
            assertionFailure("Incorrect font name")
            return .systemFont(ofSize: sizeToken.rawValue)
        }
        return font
    }
}
