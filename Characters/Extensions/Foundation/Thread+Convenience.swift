//
//  Thread+Convenience.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import Foundation

public extension Thread {
    static var isNotMainThread: Bool { return !isMainThread }
    
    static var isBackgroundThread: Bool { return !isMainThread }
    static var isNotBackgroundThread: Bool { return !isBackgroundThread }
}
