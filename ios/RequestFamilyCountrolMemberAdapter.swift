//
//  RequestFamilyCountrolMemberAdapter.swift
//  ReactNativeDeviceActivityReport
//
//  Created by Choi on 9/20/24.
//

import Foundation
import FamilyControls

@available(iOS 16.0, *)
struct RequestFamilyCountrolMemberAdapter {
    
    private let center = AuthorizationCenter.shared
    
    func requestFamilyControls(for value: FamilyControlsMember) async -> Bool {
        do {
            try await center.requestAuthorization(for: value)
            return true
        } catch(let error) {
            debugPrint(error)
            return false
        }
        
    }
}
