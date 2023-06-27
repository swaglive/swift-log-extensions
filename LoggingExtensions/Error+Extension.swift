//
//  Error+Extension.swift
//  LoggingExtensions
//
//  Created by 立宣于 on 2023/6/27.
//

import Foundation
import Logging

extension NSError: LoggerMetadataConvertible {
    public var loggerMetadata: Logger.Metadata {
        var meta: Logger.Metadata = [
            "code": Logger.MetadataValue.stringConvertible(code),
            "message": Logger.MetadataValue.string(localizedDescription ?? "unknown"),
        ]
        var details: Logger.Metadata = ["domain": .string(domain)]
        if #available(iOS 14.5, *) {
            if !underlyingErrors.isEmpty {
                details["errors"] =
                    .array(
                        underlyingErrors.map { ($0 as NSError).loggerMetadataValue }
                    )
            }
        }
        meta["details"] = .dictionary(details)
        return meta
    }
}
