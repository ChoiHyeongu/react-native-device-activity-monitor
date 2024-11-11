import Foundation
import DeviceActivity
import SwiftUI

@available(iOS 16, *)
final class DeviceActivityReportViewModel: ObservableObject {
  private let startDate: Date = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: .now)!
  private let endDate: Date = .now
  
  @Published var filter: DeviceActivityFilter
  
  init() {
    self.filter = DeviceActivityFilter(
      segment: .weekly(during: DateInterval(start: startDate, end: endDate)),
      users: .all,
      devices: .init([.iPhone])
    )
  }
  
  func updateFilter(
    segmentInterval: DeviceActivityFilter.SegmentInterval? = nil,
    users: DeviceActivityFilter.Users? = nil,
    devices: DeviceActivityFilter.Devices? = nil
  ) {
    let updatedSegment = segmentInterval ?? filter.segmentInterval
    let updatedUsers = users ?? filter.users ?? .all
    let updatedDevices = devices ?? filter.devices ?? .init([.iPhone])

    filter = DeviceActivityFilter(
      segment: updatedSegment,
      users: updatedUsers,
      devices: updatedDevices
    )
  }
}
