//
//  Logger.swift
//  SitooAssignment
//
//  Class were are functions related with the logging of the app.
//
//  Created by Esteban Pavez on 2019-01-14.
//  Copyright © 2019 Esteban Pavez. All rights reserved.
//

import Foundation
import UIKit

struct Logger {

    /// Set a log in the console while the app is running
    /// - Parameters:
    ///   - message: Message of the description of the log
    ///   - path: Path of where the log is called from
    ///   - function: Function where the log is called of
    static func log(_ message: String = "", _ path: String = #file, _ function: String = #function) {
        let file = path.components(separatedBy: "/").last!.components(separatedBy: ".").first!
        NSLog("%@.%@: %@", file, function, message)
    }
}
