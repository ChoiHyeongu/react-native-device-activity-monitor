//
//  DeviceParser.swift
//  ReactNativeDeviceActivityReport
//
//  Created by Choi on 11/11/24.
//

import Foundation
import DeviceActivity

@available(iOS 16.0, *)
struct DeviceParser {
    static func parseUsers(from users: NSString) -> DeviceActivityFilter.Users? {
        switch users {
        case "all": return .all
        case "children": return .children
        default:
            print("Invalid users value: \(users)")
            return nil
        }
    }
    
    static func parseDevices(from devices: NSArray) -> DeviceActivityFilter.Devices? {
        var temp: [DeviceActivityData.Device.Model] = []
        
        for device in devices {
            guard let deviceString = device as? String else {
                print("Invalid device type: \(device)")
                continue
            }
            
            switch deviceString {
            case "iPhone": temp.append(.iPhone)
            case "iPad": temp.append(.iPad)
            default:
                print("Unsupported device type: \(deviceString)")
            }
        }
        
        guard !temp.isEmpty else {
            print("No valid devices found in array")
            return nil
        }
        
        return DeviceActivityFilter.Devices(.init(temp))
    }
}
