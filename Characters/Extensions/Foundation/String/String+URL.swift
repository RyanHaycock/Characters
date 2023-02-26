//
//  String+URL.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import Foundation

extension String {
    var asURL: URL? {
        return URL(string: self)
    }
}
