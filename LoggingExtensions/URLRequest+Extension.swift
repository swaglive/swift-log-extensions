//
//  URLRequest+Extension.swift
//  LoggingExtensions
//
//  Created by 立宣于 on 2023/6/30.
//

import Foundation
import Logging

extension URLRequest: LoggerMetadataConvertible {
    public var loggerMetadata: Logger.Metadata {
        var meta = Logger.Metadata()
        if let method = httpMethod {
            meta["method"] = "\(method)"
        }
        if let url = url {
            meta["url"] = "\(url.absoluteString)"
            if let comp = URLComponents(url: url, resolvingAgainstBaseURL: false),
               let queries = comp.queryLog {
                meta["queryString"] = queries
            }
        }
        if let headers = allHTTPHeaderFields {
            meta["header"] = HTTPHeaderConverter.convert(allHeaderFields: headers)
        }
        if let body = bodyLog {
            meta["postData"] = body
            
        }
        return meta
    }

    var bodyLog: Logger.MetadataValue? {
        guard let body = httpBody else {
            return nil
        }
        var meta = Logger.Metadata()
        if let type = value(forHTTPHeaderField: "Content-Type") {
            meta["mimeType"] = "\(type)"
        }
        if let text = String(data: body, encoding: .utf8) {
            meta["text"] = "\(text.prefix(1024))"
        } else {
            meta["text"] = "{ Data: \(body.count) }"
        }
        return .dictionary(meta)
    }
}
