//
//  ReusableView.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import UIKit

protocol ReusableView { }

// MARK: - Reuse Identifier

extension ReusableView where Self: UIView  {
    static var reuseIdentifier: String { return String(describing: self) }
}
