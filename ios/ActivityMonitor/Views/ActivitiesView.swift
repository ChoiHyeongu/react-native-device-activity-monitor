//
//  ActivitiesView.swift
//  Monitor
//
//  Created by Pedro Somensi on 06/08/23.
//

import SwiftUI

struct ActivitiesView: View {
    
    var activities: DeviceActivity
    
    var body: some View {
        List(activities.apps) { app in
            ListItem(app: app)
        }
        .listStyle(.plain) // 기본 스타일 지정
    }
}
