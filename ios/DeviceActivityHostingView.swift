//
//  DeviceActivityHostingView.swift
//  ReactNativeDeviceActivityReport
//
//  Created by Choi on 9/20/24.
//

import Foundation

import SwiftUI

@available(iOS 16.0, *)
final class DeviceActivityHostingView: UIView {
  var view: UIView?
  var viewModel = DeviceActivityReportViewModel()
  

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupView()
  }
  
  @objc func setSegment(_ segment: NSString) {
    if(segment == "hourly") {
      viewModel.updateFilter(segment: .hourly)
    }
    
    if(segment == "daily") {
      viewModel.updateFilter(segment: .daily)
    }
    
    if(segment == "weekly") {
      viewModel.updateFilter(segment: .weekly)
    }
  }
  
  @objc func setUsers(_ users: NSString) {
    if(users == "all") {
      viewModel.updateFilter(users: .all)
    }
    
    if(users == "children") {
      viewModel.updateFilter(users: .children)
    }
  }

  private func setupView() {
    let view = DeviceActivityReportAdapter(viewModel: viewModel)
    let vc = UIHostingController(rootView: view)
    vc.view.frame = bounds
    self.addSubview(vc.view)
    self.view = vc.view
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    view?.frame = bounds
  }
}
