//
//  DeviceActivityReportManager.m
//  whatssub
//
//  Created by Choi on 9/20/24.
//

#import "React/RCTViewManager.h"

@interface

RCT_EXTERN_MODULE(DeviceActivityReportManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(segmentInterval, NSDictionary)
RCT_EXPORT_VIEW_PROPERTY(users, NSString)
RCT_EXPORT_VIEW_PROPERTY(devices, NSArray)

@end
