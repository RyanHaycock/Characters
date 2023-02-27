//
//  LogManager.swift
//  Characters
//
//  Created by Ryan Haycock on 27/02/2023.
//

import Foundation

protocol LogManager {
    func log(_ error: Error)
    func log(_ message: String)
}

// In a production app we want to avoid printing to the console but it might be useful
// to log these errors on some external service such as Firebase
final class MainLogManager: LogManager {
    func log(_ error: Error) {
        #if DEBUG
        print(error)
        #endif
    }
    
    func log(_ message: String) {
        #if DEBUG
        print(message)
        #endif
    }
}
