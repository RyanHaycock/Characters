//
//  RadiusToken.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import UIKit

enum RadiusToken: CGFloat {
    case small = 4
    case medium = 8
    case large = 12
}

// MARK: - CALayer Convenience

extension CALayer {
    /// Sets the corner radius to the token's value. Optionally, set the layer to mask to bounds.
    func setCornerRadius(_ token: RadiusToken, maskToBounds: Bool = false) {
        cornerRadius = token.rawValue
        masksToBounds = maskToBounds
    }
}

// MARK: - UIView Convenience

extension UIView {
    /// Sets the corner radius to the token's value. Optionally, set the layer to mask to bounds.
    func setCornerRadius(_ token: RadiusToken, maskToBounds: Bool = false) {
        layer.setCornerRadius(token, maskToBounds: maskToBounds)
    }
}
