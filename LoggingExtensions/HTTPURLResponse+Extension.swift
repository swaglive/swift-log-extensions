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
            "status": "\(statusCode)"
        ]
        if let url = url {
            meta["url"] = "\(url)"
        }
        var headers = [Logger.Metadata.Value]()
        for (key, val) in allHeaderFields {
            if let key = key as? String, let val = val as? String {
                headers.append(.dictionary([key: "\(val)"]))
            }
        }
        meta["header"] = .array(headers)
        return meta
    }
}
