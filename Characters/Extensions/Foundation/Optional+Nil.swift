//
//  Optional+Nil.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import Foundation

extension Optional {
    var isNil: Bool { return self == nil }
    var isNotNil: Bool { return self != nil }
}
