import SwiftUI

struct EventDetailView: View {
    let event: Event // The event being displayed

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Live Scores
                VStack {
                    Text("Live Score")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Team A: 78 - Team B: 83")
                        .font(.headline)
                        .foregroundColor(.red) // Example styling
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

                // Event Details
                VStack(alignment: .leading, spacing: 8) {
                    Text("Teams")
                        .font(.headline)
                    Text(event.title)
                        .font(.title)
                        .fontWeight(.bold)

                    Text("Start Time")
                        .font(.headline)
                    Text(event.time)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemBackground))
                .cornerRadius(10)
                .shadow(radius: 3)
                .padding(.horizontal)

                // Features Section
                VStack(spacing: 16) {
                    Button(action: {
                        // Chat functionality
                    }) {
                        HStack {
                            Image(systemName: "message.fill")
                            Text("Join Chat")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }

                    Button(action: {
                        // Ticket swap functionality
                    }) {
                        HStack {
                            Image(systemName: "ticket.fill")
                            Text("Ticket Swap")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }

                    Button(action: {
                        // Meet People functionality
                    }) {
                        HStack {
                            Image(systemName: "person.3.fill")
                            Text("Meet People")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top)
        }
        .navigationTitle("Event Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(event: Event(id: 1, banner: "team1_vs_team2", title: "Lakers vs Celtics", time: "Jan 12, 6:00 PM"))
    }
}

