//
//  SegmentType.swift
//  ReactNativeDeviceActivityReport
//
//  Created by Choi on 9/28/24.
//

import Foundation

enum SegmentType: String, CaseIterable, Identifiable {
    case hourly = "Hourly"
    case daily = "Daily"
    case weekly = "Weekly"
    
    var id: String { self.rawValue }
}
