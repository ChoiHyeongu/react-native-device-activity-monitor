import SwiftUI

struct ListItem: View {
    private let app: ActivityApp
    @State private var isTapped = false // 클릭 상태를 관리하는 상태 변수
    
    init(app: ActivityApp) {
        self.app = app
    }
  
    // DateComponentsFormatter 설정
    let formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second] // 시, 분, 초를 표시하도록 설정
        formatter.unitsStyle = .full // 시, 분, 초 단위 표시를 위한 설정
        return formatter
    }()
    
    func formattedDuration(_ duration: TimeInterval) -> String {
        let hours = Int(duration) / 3600
        let minutes = (Int(duration) % 3600) / 60
        let seconds = Int(duration) % 60
        
        // 시, 분, 초로 표시하는 문자열 구성
        return "\(hours)시 \(minutes)분 \(seconds)초"
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(app.localizedName ?? "No Named")
                Text(app.bundleIdentifier ?? "No Named")
                    .font(.caption)
            }
            Spacer()
            
            // totalDuration을 시, 분, 초로 표시
            Text(formattedDuration(app.totalDuration))
        }
        .padding()
        .cornerRadius(8) // 모서리를 둥글게
    }
}
