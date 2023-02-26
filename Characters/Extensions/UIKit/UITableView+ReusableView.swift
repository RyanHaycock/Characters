//
//  UITableView+ReusableView.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import UIKit

// MARK: - Register

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
}

// MARK: - Register

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            preconditionFailure("Failed to dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
