//
//  SegmentIntervalParser.swift
//  ReactNativeDeviceActivityReport
//
//  Created by Choi on 11/11/24.
//

import Foundation
import DeviceActivity

@available(iOS 16.0, *)
struct SegmentIntervalParser {
    static func parse(from dictionary: NSDictionary) -> DeviceActivityFilter.SegmentInterval? {
        guard let type = dictionary["type"] as? String,
              let startTimestamp = dictionary["start"] as? Double,
              let endTimestamp = dictionary["end"] as? Double else {
            print("Invalid segmentInterval keys")
            return nil
        }
        
        let startDate = DateUtils.from(timestamp: startTimestamp)
        let endDate = DateUtils.from(timestamp: endTimestamp)
        let dateInterval = DateInterval(start: startDate, end: endDate)
        
        switch type {
        case "hourly": return .hourly(during: dateInterval)
        case "daily": return .daily(during: dateInterval)
        case "weekly": return .weekly(during: dateInterval)
        default:
            print("Unsupported interval type: \(type)")
            return .daily(during: dateInterval)
        }
    }
}

