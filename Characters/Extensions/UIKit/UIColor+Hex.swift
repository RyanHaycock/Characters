//
//  UIColor+Hex.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import UIKit

extension UIColor {
    public convenience init(hex: Hex, alpha: CGFloat = 1.0) {
        self.init(
            red: ((hex >> 16) & 0xFF).asCGFloat / 255,
            green: ((hex >> 8) & 0xFF).asCGFloat / 255,
            blue: (hex & 0xFF).asCGFloat / 255,
            alpha: alpha
        )
    }
}
