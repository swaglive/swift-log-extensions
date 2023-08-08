//
//  LabeledLogging.swift
//  LoggingExtensions
//
//  Created by 立宣于 on 2023/8/8.
//

import Foundation
import Logging

public protocol LabeledLogging {
    @inlinable
    func log(
        level: Logger.Level,
        _ message: @autoclosure () -> Logger.Message,
        tag: @autoclosure () -> String?,
        labels: @autoclosure () -> [String],
        metadata: @autoclosure () -> Logger.Metadata?,
        error: @autoclosure () -> Error?,
        source: @autoclosure () -> String?,
        file: String,
        function: String,
        line: UInt
    )
}

public extension LabeledLogging {
    @inlinable
    func trace(
        _ message: @autoclosure () -> Logger.Message,
        tag: @autoclosure () -> String? = nil,
        labels: @autoclosure () -> [String] = [],
        metadata: @autoclosure () -> Logger.Metadata? = nil,
        source: @autoclosure () -> String? = nil,
        file: String = #file,
        function: String = #function,
        line: UInt = #line
    ) {
        log(
            level: .trace,
            message(),
            tag: tag(),
            labels: labels(),
            metadata: metadata(),
            error: nil,
            source: source(),
            file: file,
            function: function,
            line: line
        )
    }

    @inlinable
    func debug(
        _ message: @autoclosure () -> Logger.Message,
        tag: @autoclosure () -> String? = nil,
        labels: @autoclosure () -> [String] = [],
        metadata: @autoclosure () -> Logger.Metadata? = nil,
        source: @autoclosure () -> String? = nil,
        file: String = #file,
        function: String = #function,
        line: UInt = #line
    ) {
        log(
            level: .debug,
            message(),
            tag: tag(),
            labels: labels(),
            metadata: metadata(),
            error: nil,
            source: source(),
            file: file,
            function: function,
            line: line
        )
    }

    @inlinable
    func info(
        _ message: @autoclosure () -> Logger.Message,
        tag: @autoclosure () -> String? = nil,
        labels: @autoclosure () -> [String] = [],
        metadata: @autoclosure () -> Logger.Metadata? = nil,
        source: @autoclosure () -> String? = nil,
        file: String = #file,
        function: String = #function,
        line: UInt = #line
    ) {
        log(
            level: .info,
            message(),
            tag: tag(),
            labels: labels(),
            metadata: metadata(),
            error: nil,
            source: source(),
            file: file,
            function: function,
            line: line
        )
    }

    @inlinable
    func notice(
        _ message: @autoclosure () -> Logger.Message,
        tag: @autoclosure () -> String? = nil,
        labels: @autoclosure () -> [String] = [],
        metadata: @autoclosure () -> Logger.Metadata? = nil,
        source: @autoclosure () -> String? = nil,
        file: String = #file,
        function: String = #function,
        line: UInt = #line
    ) {
        log(
            level: .notice,
            message(),
            tag: tag(),
            labels: labels(),
            metadata: metadata(),
            error: nil,
            source: source(),
            file: file,
            function: function,
            line: line
        )
    }

    @inlinable
    func warning(
        _ message: @autoclosure () -> Logger.Message,
        tag: @autoclosure () -> String? = nil,
        labels: @autoclosure () -> [String] = [],
        error: @autoclosure () -> Error? = nil,
        metadata: @autoclosure () -> Logger.Metadata? = nil,
        source: @autoclosure () -> String? = nil,
        file: String = #file,
        function: String = #function,
        line: UInt = #line
    ) {
        log(
            level: .warning,
            message(),
            tag: tag(),
            labels: labels(),
            metadata: metadata(),
            error: error(),
            source: source(),
            file: file,
            function: function,
            line: line
        )
    }

    @inlinable
    func error(
        _ message: @autoclosure () -> Logger.Message,
        tag: @autoclosure () -> String? = nil,
        labels: @autoclosure () -> [String] = [],
        error: @autoclosure () -> Error? = nil,
        metadata: @autoclosure () -> Logger.Metadata? = nil,
        source: @autoclosure () -> String? = nil,
        file: String = #file,
        function: String = #function,
        line: UInt = #line
    ) {
        log(
            level: .error,
            message(),
            tag: tag(),
            labels: labels(),
            metadata: metadata(),
            error: error(),
            source: source(),
            file: file,
            function: function,
            line: line
        )
    }

    @inlinable
    func critical(
        _ message: @autoclosure () -> Logger.Message,
        tag: @autoclosure () -> String? = nil,
        labels: @autoclosure () -> [String] = [],
        error: @autoclosure () -> Error? = nil,
        metadata: @autoclosure () -> Logger.Metadata? = nil,
        source: @autoclosure () -> String? = nil,
        file: String = #file,
        function: String = #function,
        line: UInt = #line
    ) {
        log(
            level: .critical,
            message(),
            tag: tag(),
            labels: labels(),
            metadata: metadata(),
            error: error(),
            source: source(),
            file: file,
            function: function,
            line: line
        )
    }
}
