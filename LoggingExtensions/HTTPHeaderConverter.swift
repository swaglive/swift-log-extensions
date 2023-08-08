//
//  HTTPHeaderConverter.swift
//  LoggingExtensions
//
//  Created by 立宣于 on 2023/6/30.
//

import Foundation
import Logging

struct HTTPHeaderConverter {
    static func convert(allHeaderFields: [AnyHashable: Any]) -> Logger.MetadataValue {
        var headers = [Logger.Metadata.Value]()
        for (key, val) in allHeaderFields {
            headers.append(.dictionary(["name": "\(key)", "value": "\(val)"]))
        }
        return .array(headers)
    }
}
