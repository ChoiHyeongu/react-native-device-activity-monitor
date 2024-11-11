//
//  DateUtils.swift
//  ReactNativeDeviceActivityReport
//
//  Created by Choi on 11/11/24.
//

import Foundation

struct DateUtils {
    static func from(timestamp: Double) -> Date {
        return Date(timeIntervalSince1970: timestamp / 1000)
    }
    
    static func from(isoString: String) -> Date? {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        isoFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return isoFormatter.date(from: isoString)
    }
}

