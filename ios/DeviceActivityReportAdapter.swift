import SwiftUI
import DeviceActivity

@available(iOS 16.0, *)
struct DeviceActivityReportAdapter: View {
  
  let requestAuthorization = RequestFamilyCountrolMemberAdapter()
  @ObservedObject var viewModel: DeviceActivityReportViewModel
  
  @State private var context: DeviceActivityReport.Context = .init(rawValue: "ScreenTime")
  
  var body: some View {
    DeviceActivityReport(context, filter: viewModel.filter)
  }
}
