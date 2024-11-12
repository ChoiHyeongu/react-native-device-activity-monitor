import Foundation

struct DeviceActivityApplication: Identifiable, Hashable {
    // MARK: - 프로퍼티
    var id: String
    var bundleIdentifier: String?
    var localizedDisplayName: String?
    var duration: TimeInterval

    // MARK: - 계산된 프로퍼티
    var formattedDuration: String {
        // Format duration as "Xh Ym Zs"
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: duration) ?? "0s"
    }

    // MARK: - 초기화
    init(
        id: String,
        bundleIdentifier: String? = nil,
        localizedDisplayName: String? = nil,
        duration: TimeInterval = 0
    ) {
        self.id = id
        self.bundleIdentifier = bundleIdentifier
        self.localizedDisplayName = localizedDisplayName
        self.duration = duration
    }
}
