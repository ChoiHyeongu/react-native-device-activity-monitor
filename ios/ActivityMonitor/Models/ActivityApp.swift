//
//  ActivityApp.swift
//  ActivityMonitor
//
//  Created by Choi on 9/21/24.
//

import Foundation

struct ActivityApp: Identifiable {
  var id: String
  var bundleIdentifier: String?
  var localizedName: String?
  var totalDuration: TimeInterval
}
