//
//  LabeledLogger.swift
//  LoggingExtensions
//
//  Created by 立宣于 on 2023/8/8.
//

import Foundation
import Logging

public class LabeledLogger {
    public let labels: [String]
    public let logger: Logger

    public init(labels: [String], loggerID: String) {
        self.labels = labels
        // NOTE: loggerID is for log handler look up, not for log labelling.
        var logger = Logger(label: loggerID)
        logger.logLevel = .trace
        self.logger = logger
    }
}

public class LabeledLoggerBuilder {
    public let labels: [String]
    public let loggerID: String
    
    public init(labels: [String], loggerID: String) {
        self.labels = labels
        self.loggerID = loggerID
    }
    
    public convenience init(label: String, loggerID: String) {
        self.init(labels: [label], loggerID: loggerID)
    }
    
    public func addingLabels(labels: [String]) -> LabeledLoggerBuilder {
        return LabeledLoggerBuilder(
            labels: self.labels + labels, loggerID: loggerID
        )
    }
    
    public func addingLabel(label: String) -> LabeledLoggerBuilder {
        addingLabels(labels: [label])
    }
    
    public func build() -> LabeledLogger {
        LabeledLogger(labels: labels, loggerID: loggerID)
    }
}

extension LabeledLogger: LabeledLogging {
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
        logger.log(
            level: level,
            message(),
            tag: tag(),
            labels: self.labels + labels(),
            metadata: metadata(),
            error: error(),
            source: source(),
            file: file,
            function: function,
            line: line
        )
    }
}
