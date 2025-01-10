import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack {
            Text("Search Screen")
                .font(.largeTitle)
                .padding()

            TextField("Search for events...", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // Mock search results
            List(1...10, id: \.self) { result in
                Text("Search Result \(result)")
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
