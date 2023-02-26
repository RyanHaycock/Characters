//
//  NSDirectionalEdgeInsets+Convenience.swift
//  Characters
//
//  Created by Ryan Haycock on 26/02/2023.
//

import UIKit

extension NSDirectionalEdgeInsets {
    init(all value: CGFloat) {
        self.init(
            top: value,
            leading: value,
            bottom: value,
            trailing: value
        )
    }
    
    init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
        self.init(
            top: vertical,
            leading: horizontal,
            bottom: vertical,
            trailing: horizontal
        )
    }
    
    init(top: CGFloat = 0, bottom: CGFloat = 0, left: CGFloat = 0, right: CGFloat = 0) {
        self.init(
            top: top,
            leading: left,
            bottom: bottom,
            trailing: right
        )
    }
}
