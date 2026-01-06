import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            // White base
            Color.white
                .edgesIgnoringSafeArea(.all)

            // Ellipse 194
            // 1200x1200, Left: -146, Top: 176
            // Center calculation: x = -146 + 600 = 454. y = 176 + 600 = 776.
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(red: 45/255, green: 45/255, blue: 45/255, opacity: 0.12), location: 0.0167),
                            .init(color: Color(red: 23/255, green: 23/255, blue: 23/255, opacity: 0.02), location: 0.1401),
                            .init(color: Color(red: 0, green: 0, blue: 0, opacity: 0.02), location: 0.6893)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom // 181.98deg is approx top-to-bottom
                    )
                )
                .frame(width: 1200, height: 1200)
                .position(x: 454, y: 776)

            // Ellipse 195
            // 920x920, Left: 52, Top: 316
            // Center calculation: x = 52 + 460 = 512. y = 316 + 460 = 776
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color(red: 45/255, green: 45/255, blue: 45/255, opacity: 0.06), location: 0.0912),
                            .init(color: Color(red: 18/255, green: 18/255, blue: 18/255, opacity: 0.02), location: 0.3653),
                            .init(color: Color(red: 0, green: 0, blue: 0, opacity: 0.01), location: 0.6227),
                            .init(color: Color(red: 0, green: 0, blue: 0, opacity: 0.01), location: 0.8455)
                        ]),
                        // 167.43deg is slightly tilted. CSS 180 is top-to-bottom. 167 is 13 deg counter-clockwise.
                        // We approximate with UnitPoints or just use top-to-bottom rotated.
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .rotationEffect(.degrees(-13)) // Rotate the gradient inside the circle
                .frame(width: 920, height: 920)
                .position(x: 512, y: 776)
        }
        .drawingGroup() // Optimize rendering
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
