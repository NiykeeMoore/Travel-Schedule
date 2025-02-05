//
//  String+Extensions.swift
//  Travel Schedule
//
//  Created by Niykee Moore on 04.02.2025.
//

import Foundation

extension String {
    var getLocalizedShortDate: String {
        let apiDateFormatter = DateFormatter()
        apiDateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = apiDateFormatter.date(from: self) else { return "API date format wrong" }

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd MMMM"
        return dateFormatter.string(from: date)
    }
    
    var returnTimeString: String {
        return String(self.suffix(14).prefix(5))
    }
}

extension String {
    var getLocalizedDuration: String {
        guard let totalSeconds = Double(self) else { return "API duration format wrong" }
        let hours = Int(totalSeconds) / 3600
        let minutes = (Int(totalSeconds) % 3600) / 60
        return "\(hours) ч \(minutes) мин"
    }
}
