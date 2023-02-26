//
//  String+Optional.swift
//  Characters
//
//  Created by Ryan Haycock on 26/02/2023.
//

import Foundation

extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        guard let self = self else { return true }
        return self.isEmpty
    }
    
    var isNotNilOrEmpty: Bool {
        return !isNilOrEmpty
    }
}
