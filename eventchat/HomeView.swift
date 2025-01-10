import SwiftUI

struct HomeView: View {
    @State private var selectedCategory: String = "My Picks"

    // Mock data for events
    let sportsEvents = [
        Event(id: 1, banner: "team1_vs_team2", title: "Lakers vs Celtics", time: "Jan 12, 6:00 PM"),
        Event(id: 2, banner: "team3_vs_team4", title: "Heat vs Bulls", time: "Jan 13, 7:30 PM")
    ]
    let liveMusicEvents = [
        Event(id: 3, banner: "concert1", title: "Taylor Swift Live", time: "Jan 20, 8:00 PM"),
        Event(id: 4, banner: "concert2", title: "Coldplay Live", time: "Feb 10, 7:30 PM")
    ]
    let otherEvents = [
        Event(id: 5, banner: "expo1", title: "Tech Expo 2025", time: "Mar 5, 10:00 AM"),
        Event(id: 6, banner: "festival1", title: "Food Festival", time: "Mar 20, 12:00 PM")
    ]
    let myPicks = [
        Event(id: 2, banner: "team3_vs_team4", title: "Heat vs Bulls", time: "Jan 13, 7:30 PM"),
        Event(id: 4, banner: "concert2", title: "Coldplay Live", time: "Feb 10, 7:30 PM")
    ]

    var body: some View {
        NavigationView {
            VStack {
                // Top Category Navigation
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        CategoryButton(title: "My Picks", isSelected: selectedCategory == "My Picks") {
                            selectedCategory = "My Picks"
                        }
                        CategoryButton(title: "Sports", isSelected: selectedCategory == "Sports") {
                            selectedCategory = "Sports"
                        }
                        CategoryButton(title: "Live Music", isSelected: selectedCategory == "Live Music") {
                            selectedCategory = "Live Music"
                        }
                        CategoryButton(title: "Others", isSelected: selectedCategory == "Others") {
                            selectedCategory = "Others"
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)

                // Event Grid Based on Selected Category
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(getEventsForCategory()) { event in
                            NavigationLink(destination: EventDetailView(event: event)) {
                                EventCard(event: event)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Upcoming Events")
        }
    }

    // Helper Function to Get Events for Selected Category
    func getEventsForCategory() -> [Event] {
        switch selectedCategory {
        case "My Picks": return myPicks
        case "Sports": return sportsEvents
        case "Live Music": return liveMusicEvents
        case "Others": return otherEvents
        default: return []
        }
    }
}

struct CategoryButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(isSelected ? .white : .blue)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(isSelected ? Color.blue : Color.clear)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.blue, lineWidth: isSelected ? 0 : 1)
                )
        }
    }
}
struct EventCard: View {
    let event: Event

    var body: some View {
        VStack(alignment: .leading) {
            Rectangle() // Placeholder for event banner
                .fill(Color.gray) // Replace this with Image(event.banner) when assets are added
                .frame(height: 120)
                .cornerRadius(10)

            Text(event.title)
                .font(.headline)
                .padding(.top, 4)

            Text(event.time)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}
