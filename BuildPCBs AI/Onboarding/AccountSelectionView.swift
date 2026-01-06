import SwiftUI

struct AccountSelectionView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 24) {

            VStack(spacing: 8) {
                Text("Select your account")
                    .font(.custom("DM Sans", size: 15))
                    .fontWeight(.medium) // 500
                    .foregroundColor(Color(red: 75/255, green: 75/255, blue: 75/255)) // #4B4B4B
                    .kerning(0.01 * 15)

                Text(subtitleText)
                    .font(.custom("DM Sans", size: 13))
                    .kerning(0.01 * 13)
            }
            .padding(.top, 40)

            VStack(spacing: 19) { // Gap between wallet buttons (208 - 139 - 50 = ~19px spacing)
                // MetaMask Button
                Button(action: {}) {
                    HStack(spacing: 0) {
                        // 35% of 300 is 105
                        HStack(spacing: 0) {
                            Spacer()
                            Image("metamask-logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                        }
                        .frame(width: 105)

                        // 65% of 300 is 195
                        HStack(spacing: 0) {
                            Text("MetaMask")
                                .font(.custom("DM Sans", size: 15))
                                .fontWeight(.medium)
                                .foregroundColor(Color(red: 75/255, green: 75/255, blue: 75/255)) // #4B4B4B
                            Spacer()
                        }
                        .frame(width: 195)
                        .padding(.leading, 12) // Slightly offset text from center line
                    }
                    .frame(width: 300, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 99)
                            .stroke(Color.themeBlue, lineWidth: 0.5)
                    )
                }

                // Phantom Button
                Button(action: {}) {
                    HStack(spacing: 0) {
                        // 35% of 300 is 105
                        HStack(spacing: 0) {
                            Spacer()
                            Image("phantom-logo")
                                .resizable()
                                .scaledToFill() // Fill the 21x21 circle
                                .frame(width: 21, height: 21) // 21x21 mask frame
                                .clipShape(Circle())
                        }
                        .frame(width: 105)

                        // 65% of 300 is 195
                        HStack(spacing: 0) {
                            Text("Phantom")
                                .font(.custom("DM Sans", size: 15))
                                .fontWeight(.medium)
                                .foregroundColor(Color(red: 75/255, green: 75/255, blue: 75/255)) // #4B4B4B
                            Spacer()
                        }
                        .frame(width: 195)
                        .padding(.leading, 12) // Slightly offset text from center line
                    }
                    .frame(width: 300, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 99)
                            .stroke(Color.themeBlue, lineWidth: 0.5)
                    )
                }

                // OR Divider
                HStack {
                    Text("or")
                        .font(.custom("DM Sans", size: 13))
                        .foregroundColor(Color(red: 141/255, green: 141/255, blue: 141/255)) // #8D8D8D
                }
                .padding(.vertical, 8)

                // Social Options (Google & Apple)
                HStack(spacing: 13) { // Gap between buttons
                    // Google
                    Button(action: {}) {
                        Image("google-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .frame(width: 100, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 99)
                                    .stroke(Color.themeBlue, lineWidth: 0.5)
                            )
                    }

                    // Apple
                    Button(action: {}) {
                        Image(systemName: "apple.logo")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                            .frame(width: 100, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 99)
                                    .stroke(Color.themeBlue, lineWidth: 0.5)
                            )
                    }
                }
            }
            .padding(.horizontal, 24)

            Spacer()
        }
        .padding(.bottom, 30)
    }

    private var subtitleText: AttributedString {
        var text = AttributedString("Select a Solana account to earn $build.")
        text.foregroundColor = Color(red: 141/255, green: 141/255, blue: 141/255) // Default gray

        if let range = text.range(of: "$build") {
            text[range].foregroundColor = .themeBlue
        }
        return text
    }
}

#Preview {
    AccountSelectionView()
}
