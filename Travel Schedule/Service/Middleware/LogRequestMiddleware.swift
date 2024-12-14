//
//  LogRequestMiddleware.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 13.12.2024.
//

import OpenAPIRuntime
import OpenAPIURLSession
import HTTPTypes
import struct Foundation.URL

struct LogRequestMiddleware: ClientMiddleware {
    func intercept(
        _ request: HTTPRequest,
        body: HTTPBody?,
        baseURL: URL,
        operationID: String,
        next: (HTTPRequest, HTTPBody?, URL) async throws -> (HTTPResponse, HTTPBody?)
    ) async throws -> (HTTPResponse, HTTPBody?) {
        return try await next(request, body, baseURL)
    }
}
