//
//  NSMutableAttributedString+Append.swift
//  Characters
//
//  Created by Ryan Haycock on 26/02/2023.
//

import UIKit

extension NSMutableAttributedString {
    func append(_ text: String, font: FontToken, size: FontSizeToken) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font : UIFont.font(font, size: size)
        ]
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        self.append(attributedString)
        return self
    }
}
