/**
 * ### Segment Interval
 * @description iOS DeviceActivityMonitor.SegmentInterval 생성 시 사용되는 interval의 enum
 */
export enum SegmentInterval {
  Hourly = "hourly",
  Daily = "daily",
  Weekly = "weekly",
}

/**
 * ### Device
 * @description iOS DeviceActivityMonitor의 필터 생성 시 사용되는 device의 enum
 */
export enum Device {
  iPhone = "iPhone",
  iPad = "iPad",
  Mac = "mac",
}

/**
 * ### User
 * @description iOS DeviceActivityMonitor의 필터 생성 시 사용되는 user의 enum
 */
export enum User {
  All = "all",
  Children = "children",
}
