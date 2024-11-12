//
//  TotalActivityReport.swift
//  MonitorReport
//
//  Created by Choi on 06/08/23.
//

import DeviceActivity
import SwiftUI

extension DeviceActivityReport.Context {
    // If your app initializes a DeviceActivityReport with this context, then the system will use
    // your extension's corresponding DeviceActivityReportScene to render the contents of the
    // report.
    static let totalActivity = Self("ScreenTime")
}

struct TotalActivityReport: DeviceActivityReportScene {
    let context: DeviceActivityReport.Context = .totalActivity
  
    let content: (DeviceActivity) -> TotalActivityView

    // 필터링할 앱의 번들 아이디 목록
    var filteredBundleIdentifiers: [String]?

    func makeConfiguration(representing data: DeviceActivityResults<DeviceActivityData>) async -> DeviceActivity {
        let totalDuration = await DeviceActivityReportHelper.calculateTotalDuration(from: data)
        let apps = await DeviceActivityReportHelper.fetchActivityApps(
            from: data,
            filter: filteredBundleIdentifiers
        )
        return DeviceActivity(duration: totalDuration, apps: apps)
    }
}
