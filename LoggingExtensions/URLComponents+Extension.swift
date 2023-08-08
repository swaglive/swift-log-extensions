//
//  URLComponents+Extension.swift
//  LoggingExtensions
//
//  Created by 立宣于 on 2023/8/8.
//

import Foundation
import Logging

extension URLComponents {
    var queryLog: Logger.MetadataValue? {
        guard let items = queryItems else {
            return nil
        }
        var values = [Logger.Metadata.Value]()
        for item in items {
            guard let value = item.value else {
                continue
            }
            values.append(.dictionary(["name": "\(item.name)", "value": "\(value)"]))
        }
        return .array(values)
    }
}
