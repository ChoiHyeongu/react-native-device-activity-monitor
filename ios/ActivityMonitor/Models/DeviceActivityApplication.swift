//
//  DeviceActivityApplication.swift
//  ActivityMonitor
//
//  Created by Choi on 9/21/24.
//

import Foundation

struct DeviceActivityApplication: Identifiable {
  var id: String
  var bundleIdentifier: String?
  var localizedDisplayName: String?
  var duration: TimeInterval
}
