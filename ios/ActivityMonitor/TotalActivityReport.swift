//
//  TotalActivityReport.swift
//  MonitorReport
//
//  Created by Pedro Somensi on 06/08/23.
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
    
    // Define which context your scene will represent.
    let context: DeviceActivityReport.Context = .totalActivity
    
    // Define the custom configuration and the resulting view for this report.
    let content: (DeviceActivity) -> TotalActivityView
    
    func makeConfiguration(representing data: DeviceActivityResults<DeviceActivityData>) async -> DeviceActivity {
        
        var list: [ActivityApp] = []
        let totalActivityDuration = await data.flatMap { $0.activitySegments }.reduce(0, {
            $0 + $1.totalActivityDuration
        })
        
        for await _data in data {
            for await activity in _data.activitySegments {
                for await category in activity.categories {
                    for await app in category.applications {
                        let appList = [
                          "com.netflix.Netflix",
                          "com.google.ios.youtube",
                          "com.disney.disneyplus",
                          "com.tinyspeck.chatlyio",
                          "notion.id",
                          "com.iwilab.KakaoTalk",
                        ]
                        
                        // bundleIdentifier가 appList에 포함되는 경우에만 list에 추가
                        if let bundleIdentifier = app.application.bundleIdentifier,
                           appList.contains(bundleIdentifier) {
                            let app = ActivityApp(
                                id: bundleIdentifier,
                                bundleIdentifier: bundleIdentifier,
                                localizedName: app.application.localizedDisplayName,
                                totalDuration: app.totalActivityDuration
                            )
                            list.append(app)
                        }
                    }
                }
            }
        }
        
        list.sort { $0.id > $1.id }
        return DeviceActivity(duration: totalActivityDuration, apps: list)
    }
}
