import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profile Screen")
                .font(.largeTitle)
                .padding()

            // Mock profile info
            Text("User: Your Name")
                .font(.headline)
                .padding()
            
            Text("Bio: This is a mock profile screen.")
                .padding()

            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
