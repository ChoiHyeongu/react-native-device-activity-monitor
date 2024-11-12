//
//  DeviceActivityReportHelper.swift
//  ActivityMonitor
//
//  Created by Choi on 11/12/24.
//

import DeviceActivity
import SwiftUI

struct DeviceActivityReportHelper {
    
    // 총 사용 시간을 계산하는 함수
    static func calculateTotalDuration(from data: DeviceActivityResults<DeviceActivityData>) async -> TimeInterval {
        // 모든 activitySegment를 가져와 총 시간을 합산
        await data
            .flatMap { $0.activitySegments }
            .reduce(0) { $0 + $1.totalActivityDuration }
    }

    // 활동 앱 데이터를 가져오고 번들 ID별로 병합하는 함수
    static func fetchActivityApps(
        from data: DeviceActivityResults<DeviceActivityData>,
        filter: [String]?
    ) async -> [ActivityApp] {
        var appDurations: [String: TimeInterval] = [:] // 번들 ID별 총 시간을 저장
        var appDetails: [String: ActivityApp] = [:] // 번들 ID별 앱 정보를 저장

        // DeviceActivityResults 데이터를 순회하며 앱 정보를 추출
        for await activityData in data {
            for await activitySegment in activityData.activitySegments {
                for await category in activitySegment.categories {
                    for await app in category.applications {
                        guard let bundleIdentifier = app.application.bundleIdentifier, // 번들 ID가 존재해야 함
                              let token = app.application.token else { // 토큰이 존재해야 함
                            continue
                        }

                        // 번들 ID별 총 시간 합산
                        appDurations[bundleIdentifier, default: 0] += app.totalActivityDuration

                        // 번들 ID가 처음 등장한 경우 앱 세부 정보를 저장
                        if appDetails[bundleIdentifier] == nil {
                            appDetails[bundleIdentifier] = ActivityApp(
                                id: bundleIdentifier,
                                bundleIdentifier: bundleIdentifier,
                                localizedName: app.application.localizedDisplayName, // 지역화된 앱 이름
                                token: token,
                                totalActivityDuration: 0, // 나중에 업데이트될 예정
                                numberOfPickups: app.numberOfPickups, // 앱 픽업 횟수
                                numberOfNotifications: app.numberOfNotifications // 알림 수
                            )
                        }
                    }
                }
            }
        }

        // 저장된 앱 정보에 총 사용 시간을 업데이트
        let mergedApps = appDetails.map { key, app -> ActivityApp in
            var updatedApp = app
            updatedApp.totalActivityDuration = appDurations[key] ?? 0
            return updatedApp
        }

        // 필터가 주어진 경우 필터에 포함된 앱만 반환
        let filteredApps = filter != nil
            ? mergedApps.filter { filter!.contains($0.bundleIdentifier ?? "") }
            : mergedApps

        // 번들 ID를 기준으로 정렬하여 반환
        return filteredApps.sorted { $0.bundleIdentifier ?? "" < $1.bundleIdentifier ?? "" }
    }
}
