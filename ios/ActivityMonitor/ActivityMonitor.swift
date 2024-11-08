//
//  ActivityMonitor.swift
//  ActivityMonitor
//
//  Created by Choi on 9/20/24.
//

import DeviceActivity
import SwiftUI

@main
struct ActivityMonitor: DeviceActivityReportExtension {
    var body: some DeviceActivityReportScene {
        // Create a report for each DeviceActivityReport.Context that your app supports.
        TotalActivityReport { totalActivity in
            TotalActivityView(deviceActivity: totalActivity)
        }
        // Add more reports here...
    }
}
