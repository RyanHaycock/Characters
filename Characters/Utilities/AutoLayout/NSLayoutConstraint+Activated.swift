//
//  NSLayoutConstraint+Activated.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import UIKit

extension NSLayoutConstraint {
    @discardableResult
    func activated() -> NSLayoutConstraint {
        let mutableSelf = self
        mutableSelf.isActive = true
        return mutableSelf
    }
}
