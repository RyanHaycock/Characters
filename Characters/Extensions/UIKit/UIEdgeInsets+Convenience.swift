//
//  UIEdgeInsets+Convenience.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import UIKit

extension UIEdgeInsets {
    init(all value: CGFloat) {
        self.init(
            top: value,
            left: value,
            bottom: value,
            right: value
        )
    }
    
    init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
        self.init(
            top: vertical,
            left: horizontal,
            bottom: vertical,
            right: horizontal
        )
    }
    
    init(top: CGFloat = 0, bottom: CGFloat = 0, left: CGFloat = 0, right: CGFloat = 0) {
        self.init(
            top: top,
            left: left,
            bottom: bottom,
            right: right
        )
    }
}
