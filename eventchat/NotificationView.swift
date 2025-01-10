import SwiftUI

struct NotificationsView: View {
    var body: some View {
        VStack {
            Text("Notifications Screen")
                .font(.largeTitle)
                .padding()

            // Mock notifications
            List(1...5, id: \.self) { notif in
                Text("Notification \(notif)")
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
