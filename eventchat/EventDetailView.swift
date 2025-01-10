import SwiftUI

struct EventDetailView: View {
    let event: Event

    var body: some View {
        VStack {
            // Live Score Section
            VStack {
                Text("Live Score: 87 - 92")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 4)
                
                Text("\(event.title)")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text("Start Time: \(event.time)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(10)
            .padding()

            // Channels Section
            VStack(spacing: 20) {
                ChannelButton(title: "Chat", icon: "message.fill", color: .blue)
                ChannelButton(title: "Ticket Swap", icon: "ticket.fill", color: .orange)
                ChannelButton(title: "Meet People", icon: "person.2.fill", color: .green)
            }
            .padding()

            Spacer()
        }
        .navigationTitle("Event Details")
    }
}

struct ChannelButton: View {
    let title: String
    let icon: String
    let color: Color

    var body: some View {
        Button(action: {
            // Action for channel button
        }) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .padding()
                    .background(color)
                    .clipShape(Circle())
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(color)
                
                Spacer()
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .shadow(radius: 2)
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: Event(id: 1, banner: "team1_vs_team2", title: "Lakers vs Celtics", time: "Jan 12, 6:00 PM"))
    }
}
