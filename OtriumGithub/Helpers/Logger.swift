//
//  Logger.swift
//  OtriumGithub
//
//  Created by Nipun Ruwanpathirana on 2021-07-02.
//

import Foundation

import Foundation
class Logger {
    
    static let error: String = "error"
    static let info: String = "info"
    static let warn: String = "warn"
    static let unitTest: String = "unittest"

    static func log(_ type: LogType, file: String = #file, function: String = #function, line: Int = #line, data: Any) {
        print("::::\(type.rawValue) in: \(file)->\(function):\(line) => \(data)")
    }
}

enum LogType: String {
    case error = "error"
    case info = "info"
    case warn = "warn"
    case unitTest = "unitTest"
}
