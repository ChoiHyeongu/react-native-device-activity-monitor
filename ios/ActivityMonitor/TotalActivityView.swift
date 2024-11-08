//
//  TotalActivityView.swift
//  ActivityMonitor
//
//  Created by Choi on 9/20/24.
//

import SwiftUI

struct TotalActivityView: View {
  var deviceActivity: DeviceActivity
  
  var body: some View {
      ActivitiesView(activities: deviceActivity)
  }
}
