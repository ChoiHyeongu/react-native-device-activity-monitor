import Foundation
import DeviceActivity
import SwiftUI

@available(iOS 16.0, *)
final class DeviceActivityHostingView: UIView {
    private var view: UIView?
    private var viewModel = DeviceActivityReportViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    @objc func setSegmentInterval(_ segmentInterval: NSDictionary) {
        guard let parsedSegmentInterval = SegmentIntervalParser.parse(from: segmentInterval) else {
            print("Invalid segmentInterval format")
            return
        }
        viewModel.updateFilter(segmentInterval: parsedSegmentInterval)
    }
    
    @objc func setUsers(_ users: NSString) {
        guard let parsedUsers = DeviceParser.parseUsers(from: users) else {
            print("Invalid users value")
            return
        }
        viewModel.updateFilter(users: parsedUsers)
    }
    
    @objc func setDevices(_ devices: NSArray) {
        guard let parsedDevices = DeviceParser.parseDevices(from: devices) else {
            print("Invalid devices value")
            return
        }
        viewModel.updateFilter(devices: parsedDevices)
    }
    
    private func setupView() {
        let hostingController = UIHostingController(rootView: DeviceActivityReportAdapter(viewModel: viewModel))
        hostingController.view.frame = bounds
        self.addSubview(hostingController.view)
        self.view = hostingController.view
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        view?.frame = bounds
    }
}
