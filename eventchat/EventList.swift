//
//  EventList.swift
//  eventchat
//
//  Created by Joshua Hodgson on 5/8/25.
//

import SwiftUI

struct EventList: View {
    @StateObject private var api = TicketMasterManager()
    var body: some View {
        NavigationView {
            List(api.events, id: \.name) { event in
                VStack(alignment: .leading) {
                    Text(event.name)
                        .font(.headline)
                    Text(event.dates.start.localDate ?? "Unknown date")
                        .font(.subheadline)
                }
            }
            .navigationTitle("Dallas Sports Events")
            .onAppear {
                api.fetchDallasSportsEvents()
            }
        }
    }
}

#Preview {
    EventList()
}
