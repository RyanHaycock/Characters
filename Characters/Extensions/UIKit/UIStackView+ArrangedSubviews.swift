//
//  UIStackView+ArrangedSubviews.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0)}
    }
}
