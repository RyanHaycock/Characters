//
//  UIImage+SetImage.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import UIKit

extension UIImageView {
    // TODO: add a fade animation when on screen
    @discardableResult
    func setImage(with url: URL?) -> Cancellable? {
        guard let url = url else { return nil }
        return Env.imageService.fetchImage(for: url) { [weak self] image in
            self?.image = image
        }
    }
}
