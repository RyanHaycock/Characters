//
//  UIView+Pin.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import UIKit

// MARK: Pin

extension UIView {
    @discardableResult
    func pin(_ edges: Set<Edge>,
             to view: UIView,
             margins: UIEdgeInsets = .zero
    ) -> [Edge: NSLayoutConstraint] {
        self.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [Edge: NSLayoutConstraint]()
        
        if edges.contains(.top) {
            constraints[.top] = topAnchor.constraint(equalTo: view.topAnchor, constant: margins.top)
        }
        if edges.contains(.bottom) {
            constraints[.bottom] = bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -margins.bottom)
        }
        if edges.contains(.left) {
            constraints[.left] = leftAnchor.constraint(equalTo: view.leftAnchor, constant: margins.left)
        }
        if edges.contains(.right) {
            constraints[.right] = rightAnchor.constraint(equalTo: view.rightAnchor, constant: -margins.right)
        }
        constraints.activateAll()
        return constraints
    }
}

// MARK: Pin Safely To

extension UIView {
    @discardableResult
    func pin(_ edges: Set<Edge>,
             safelyTo view: UIView,
             margins: UIEdgeInsets = .zero
    ) -> [Edge: NSLayoutConstraint] {
        self.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [Edge: NSLayoutConstraint]()
        let safeArea = view.safeAreaLayoutGuide
        
        if edges.contains(.top) {
            constraints[.top] = topAnchor.constraint(equalTo: safeArea.topAnchor, constant: margins.top)
        }
        if edges.contains(.bottom) {
            constraints[.bottom] = bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -margins.bottom)
        }
        if edges.contains(.left) {
            constraints[.left] = leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: margins.left)
        }
        if edges.contains(.right) {
            constraints[.right] = rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -margins.right)
        }
        constraints.activateAll()
        return constraints
    }
}
