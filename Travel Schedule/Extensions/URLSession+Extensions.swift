//
//  URLSession+Extension.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 04.02.2025.
//

import Foundation

extension URLSession {
    func data(from url: URL) async throws -> (Data, URLResponse) {
        try await URLSession.shared.data(from: url, delegate: nil)
    }
}
