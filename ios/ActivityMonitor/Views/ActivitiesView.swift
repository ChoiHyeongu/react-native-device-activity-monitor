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
        
        VStack {
            ScrollView(.horizontal) {
                VStack {
                    ForEach(activities.apps) { app in
                        ListItem(app: app)
                    }
                }
            }
        }
        
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView(activities: DeviceActivity(duration: .zero, apps: [
          ActivityApp(id: "ID", totalDuration: TimeInterval())
        ]))
    }
}
