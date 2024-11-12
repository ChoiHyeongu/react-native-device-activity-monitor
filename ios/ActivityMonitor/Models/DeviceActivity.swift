import Foundation
import SwiftUI
import DeviceActivity

struct DeviceActivity: Identifiable, Hashable {
    // 프로퍼티
    var id: UUID = UUID() // 고유 식별자 추가
    let duration: TimeInterval
    let apps: [ActivityApp]

    // MARK: - 계산된 프로퍼티
    var formattedDuration: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: duration) ?? "0s"
    }

    var totalApps: Int {
        apps.count
    }
    // MARK: - 초기화
    init(duration: TimeInterval = 0, apps: [ActivityApp] = []) {
        self.duration = duration
        self.apps = apps
    }
}
