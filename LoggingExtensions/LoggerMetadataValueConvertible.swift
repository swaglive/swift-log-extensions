//
//  LoggerMetadataValueConvertible.swift
//  Runner
//
//  Created by 立宣于 on 2022/11/18.
//

import Foundation
import Logging


public protocol LoggerMetadataValueConvertible {
    var loggerMetadataValue: Logger.MetadataValue { get }
}

public protocol LoggerMetadataConvertible: LoggerMetadataValueConvertible {
    var loggerMetadata: Logger.Metadata { get }
}

public extension LoggerMetadataConvertible {
    var loggerMetadataValue: Logger.MetadataValue {
        .dictionary(loggerMetadata)
    }
}
