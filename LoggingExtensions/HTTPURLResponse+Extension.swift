//
//  HTTPURLResponse+Extension.swift
//  LoggingExtensions
//
//  Created by 立宣于 on 2023/6/27.
//

import Foundation
import Logging

extension HTTPURLResponse: LoggerMetadataConvertible {
    public var loggerMetadata: Logger.Metadata {
        var meta: Logger.Metadata = [
            "status": "\(statusCode)",
        ]
        if let url = url {
            meta["url"] = "\(url)"
        }
        meta["header"] = HTTPHeaderConverter.convert(allHeaderFields: allHeaderFields)
        return meta
    }
}
