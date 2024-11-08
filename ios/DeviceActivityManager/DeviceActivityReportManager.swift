//
//  DeviceActivityReportManager.swift
//  whatssub
//
//  Created by Choi on 9/20/24.
//

import SwiftUI
import UIKit
import React

@available(iOS 16.0, *)
@objc(DeviceActivityReportManager)
class DeviceActivityReportManager: RCTViewManager {
  override class func requiresMainQueueSetup() -> Bool {
    return true
  }

  override func view() -> UIView! {
    DeviceActivityHostingView()
  }
}
