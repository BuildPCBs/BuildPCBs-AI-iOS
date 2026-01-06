import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack {
            // Main Content
            Color.white.ignoresSafeArea()

            VStack {
                Text("Home Screen")
                    .font(.title)
                    .padding()
                Spacer()
            }

            // Custom Floating Tab Bar
            CustomTab()
        }
    }
}

#Preview {
    HomeScreen()
}
