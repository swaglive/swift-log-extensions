//
//  Logger+Extension.swift
//  LoggingExtension
//
//  Created by 立宣于 on 2023/6/27.
//

import Foundation
import Logging

extension Logger: LabeledLogging {
    @inlinable
    public func log(
        level: Logger.Level,
        _ message: @autoclosure () -> Logger.Message,
        tag: @autoclosure () -> String? = nil,
        labels: @autoclosure () -> [String] = [],
        metadata: @autoclosure () -> Logger.Metadata? = nil,
        error: @autoclosure () -> Error? = nil,
        source: @autoclosure () -> String? = nil,
        file: String = #file,
        function: String = #function,
        line: UInt = #line
    ) {
        var meta: Logger.Metadata = [:]
        if let metadata = metadata() {
            meta = metadata
        }
        if let tag = tag() {
            meta["tag"] = "\(tag)"
        }
        meta["labels"] = .array(labels().map { .string($0) })
        if let nsError = error() as? NSError {
            meta["error"] = nsError.loggerMetadataValue
        }
        log(
            level: level,
            message(),
            metadata: meta,
            source: source(),
            file: file,
            function: function,
            line: line
        )
    }
}

