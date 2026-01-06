import SwiftUI

struct CustomTab: View {
    var body: some View {
        VStack {
            Spacer()

            HStack(spacing: 24) {
                // Home Icon
                Button(action: {}) {
                    Image(systemName: "house.fill")
                        .font(.system(size: 24))
                        .foregroundColor(Color(red: 197/255, green: 197/255, blue: 197/255)) // #C5C5C5
                }

                // Plus Icon (Custom)
                Button(action: {}) {
                    ZStack {
                        // Vertical Line
                        Capsule()
                            .fill(Color(red: 75/255, green: 75/255, blue: 75/255)) // #4B4B4B
                            .frame(width: 2, height: 18)

                        // Horizontal Line
                        Capsule()
                            .fill(Color(red: 75/255, green: 75/255, blue: 75/255)) // #4B4B4B
                            .frame(width: 2, height: 18)
                            .rotationEffect(.degrees(90))
                    }
                    .frame(width: 24, height: 24)
                }

                // Buy Crypto Icon
                Button(action: {}) {
                    Image(systemName: "creditcard.fill") // Placeholder for buy-crypto
                        .font(.system(size: 24))
                        .foregroundColor(Color(red: 197/255, green: 197/255, blue: 197/255)) // #C5C5C5
                }
            }
            .padding(.horizontal, 16)
            .frame(width: 159, height: 50)
            .background(
                Color(red: 244/255, green: 244/255, blue: 244/255).opacity(0.2)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 99)
                    .stroke(Color(red: 238/255, green: 238/255, blue: 238/255), lineWidth: 0.5) // #EEEEEE
            )
            .cornerRadius(99)
            .padding(.bottom, 20) // Bottom padding/margin
        }
    }
}

#Preview {
    CustomTab()
        .background(Color.gray) // To see white/transparency
}
