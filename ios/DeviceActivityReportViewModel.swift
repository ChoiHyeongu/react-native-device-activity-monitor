import Foundation
import DeviceActivity
import SwiftUI

@available(iOS 16, *)
final class DeviceActivityReportViewModel: ObservableObject {
  private let startDate: Date = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: .now)!
  private let endDate: Date = .now
  
  @Published var filter: DeviceActivityFilter
  
  init() {
    // 초기화 이후에 필터를 설정
    self.filter = DeviceActivityFilter(
      segment: .weekly(during: DateInterval(start: startDate, end: endDate)),
      users: .all,
      devices: .init([.iPhone])
    )
  }
  
  // 파라미터를 옵셔널로 받아서 필요한 부분만 업데이트
  func updateFilter(segment: SegmentType? = nil, users: DeviceActivityFilter.Users? = nil, devices: DeviceActivityFilter.Devices? = nil) {
    let newSegmentInterval: DeviceActivityFilter.SegmentInterval
    if let segment = segment {
      newSegmentInterval = getSegmentInterval(segment: segment)
    } else {
      newSegmentInterval = filter.segmentInterval
    }
    let newUsers = users ?? filter.users ?? .all
    let newDevices = devices ?? filter.devices ?? .init([.iPhone])
    
    // 필터 업데이트
    filter = createDeviceActivityFilter(segment: newSegmentInterval, users: newUsers, devices: devices ?? .init([.iPhone]))
  }
  
  // 세그먼트에 맞는 Interval 반환
  func getSegmentInterval(segment: SegmentType) -> DeviceActivityFilter.SegmentInterval {
    let selectedInterval = DateInterval(start: startDate, end: endDate)
    
    switch segment {
    case .hourly:
      return .hourly(during: selectedInterval)
    case .daily:
      return .daily(during: selectedInterval)
    case .weekly:
      return .weekly(during: selectedInterval)
    }
  }
  
  // 필터 생성 함수
  private func createDeviceActivityFilter(segment: DeviceActivityFilter.SegmentInterval, users: DeviceActivityFilter.Users, devices: DeviceActivityFilter.Devices) -> DeviceActivityFilter {
    return DeviceActivityFilter(
      segment: segment,
      users: users,
      devices: devices
    )
  }
}
