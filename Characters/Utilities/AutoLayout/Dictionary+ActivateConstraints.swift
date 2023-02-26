//
//  Dictionary+ActivateConstraints.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import UIKit

extension Dictionary where Key == UIView.Edge, Value == NSLayoutConstraint {
    func activateAll() {
        var constraints: [NSLayoutConstraint] = []
        constraints.reserveCapacity(self.count)
        self.forEach { constraints.append($1) }
        NSLayoutConstraint.activate(constraints)
    }
}
