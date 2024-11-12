import SwiftUI
import DeviceActivity
import FamilyControls
import ManagedSettings

struct ListItem: View {
  private let app: ActivityApp
  
  init(app: ActivityApp) {
    self.app = app
  }
  
  // DateComponentsFormatter 설정
  private static let formatter: DateComponentsFormatter = {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second]
    formatter.unitsStyle = .abbreviated // 간결한 단위 스타일로 변경 (예: 1h 30m)
    return formatter
  }()
  
  var body: some View {
    HStack(spacing: 12) {
      Label(app.token)
        .labelStyle(.iconOnly)
        .padding(.leading, 8)
      
      VStack(alignment: .leading, spacing: 4) {
        Text(app.localizedName ?? "Unknown App")
          .lineLimit(1)
          .truncationMode(.tail)
          .font(.body)
        
        Text(Self.formatter.string(from: app.totalActivityDuration) ?? "0s")
          .lineLimit(1)
          .font(.caption)
          .foregroundColor(.gray)
      }
      
      Spacer()
    }
    .padding(.vertical, 12)
    .padding(.horizontal, 16)
  }
}
