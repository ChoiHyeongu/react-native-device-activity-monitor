import Foundation
import DeviceActivity
import SwiftUI
import ManagedSettings

struct ActivityApp: Identifiable, Hashable {
    // MARK: - 프로퍼티
    var id: String
    var bundleIdentifier: String?
    var localizedName: String?
    var token: ApplicationToken
    var totalActivityDuration: TimeInterval
    var numberOfPickups: Int
    var numberOfNotifications: Int

    // MARK: - 계산한 프로퍼티
    var formattedDuration: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: totalActivityDuration) ?? "0s"
    }
    // MARK: - 초기화
    init(
        id: String,
        bundleIdentifier: String? = nil,
        localizedName: String? = nil,
        token: ApplicationToken,
        totalActivityDuration: TimeInterval = 0,
        numberOfPickups: Int = 0,
        numberOfNotifications: Int = 0
    ) {
        self.id = id
        self.bundleIdentifier = bundleIdentifier
        self.localizedName = localizedName
        self.token = token
        self.totalActivityDuration = totalActivityDuration
        self.numberOfPickups = numberOfPickups
        self.numberOfNotifications = numberOfNotifications
    }
}
