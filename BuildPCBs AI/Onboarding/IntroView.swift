import SwiftUI

struct IntroView: View {
    @State private var showAccountSelection = false

    var body: some View {
        ZStack {
            BackgroundView()

            VStack(spacing: 0) {
                // Logo / Brand
                // Shifted up: top 101px.
                HStack(spacing: 7) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)

                    Text("buildPCBs")
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                }
                .padding(.top, 101) // Matches top: 101px
                .padding(.bottom, 0) // Reset bottom padding

                // Spacer to push content down to approx 511px
                // Logo bottom is ~121. Taglines top is 511. Gap ~390.
                Spacer()
                    .frame(height: 350) // Approximate gap

                // Taglines (Frame 1000010574)
                HStack(spacing: 13) {
                    // Item 1: Build hardware
                    HStack(spacing: 8) {
                        Image(systemName: "bolt.fill") // Placeholder for "flash"
                            .font(.system(size: 18))
                            .foregroundColor(.themeBlue)

                        Text("Build hardware")
                            .font(.custom("DM Sans", size: 13))
                            .fontWeight(.medium) // 500
                            .foregroundColor(Color(red: 106/255, green: 106/255, blue: 106/255)) // #6A6A6A
                            .kerning(0.01 * 13) // letter-spacing 0.01em
                    }

                    // Vertical Divider
                    Rectangle()
                        .fill(Color(red: 188/255, green: 188/255, blue: 188/255)) // #BCBCBC
                        .frame(width: 2, height: 14)
                        .cornerRadius(9)
                        // Note: Border 0.3px #A7A7A7 omitted for simplicity in SwiftUI standard shapes

                    // Item 2: Earn $build
                    HStack(spacing: 8) {
                        Image(systemName: "bitcoinsign.circle.fill") // Placeholder for "buy-crypto"
                            .font(.system(size: 18))
                            .foregroundColor(.themeBlue)

                        Text("Earn $build")
                            .font(.custom("DM Sans", size: 13))
                            .fontWeight(.medium)
                            .foregroundColor(Color(red: 106/255, green: 106/255, blue: 106/255))
                            .kerning(0.01 * 13)
                    }
                }
                .padding(.bottom, 30)

                // Main Tagline
                HStack(spacing: 0) {
                    Text("Think it. ")
                        .fontWeight(.bold)
                    Text("$BUILD it.")
                        .fontWeight(.bold)
                        .foregroundColor(.themeBlue)
                }
                .font(.title)
                .padding(.bottom, 50)

                Spacer()

                // Actions
                VStack(spacing: 16) {
                    /*
                    Button(action: {
                        // Connect Wallet Action
                    }) {
                        Text("Connect Your Wallet")
                            .font(.system(size: 15, weight: .regular)) // Smaller, not bold
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.themeBlue)
                            .cornerRadius(99)
                            .overlay(
                                RoundedRectangle(cornerRadius: 99)
                                    .stroke(Color(red: 0/255, green: 36/255, blue: 145/255), lineWidth: 1) // #002491
                            )
                    }

                    Button(action: {
                        // Sign In Action
                    }) {
                        Text("Sign In")
                            .font(.system(size: 15, weight: .regular)) // Not bold
                            .foregroundColor(.themeBlue)
                    }
                    */

                    Button(action: {
                        showAccountSelection = true
                    }) {
                        Text("Continue")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.themeBlue)
                            .cornerRadius(99)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 30)
                .sheet(isPresented: $showAccountSelection) {
                    AccountSelectionView()
                        .presentationDetents([.fraction(0.6), .large]) // custom height
                        .presentationDragIndicator(.visible)
                }

                // Footer
                // Width 208, Size 9, Color #878787 for base, themeBlue for links
                Text(footerText)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.5)
                    .frame(width: 208)
                    .padding(.bottom, 17)
            }
        }
    }

    private var footerText: AttributedString {
        var text = AttributedString("By using buildPCBs, you are agreeing to our\nTerms of Service and Privacy Policy")
        text.font = .custom("DM Sans", size: 9)
        // Base color handling: unfortunately, applying base foregroundColor on Text view often overrides AttributedString.
        // It's safer to apply it to the whole AttributedString range first.
        text.foregroundColor = Color(red: 135/255, green: 135/255, blue: 135/255) // #878787

        // Apply kerning manually or via text view modifier (modifier applies to all).
        // Since kerning modifier on Text works, we keep it there if possible, or apply to attributes.
        // SwiftUI AttributedString doesn't have a direct 'kerning' property in all versions easily,
        // but text.kern is standard found in Foundation.
        // For simplicity, we rely on the View modifier for kerning if it applies uniformly.
        // However, color MUST be in AttributedString to override view modifier.

        if let range = text.range(of: "Terms of Service") {
            text[range].foregroundColor = .themeBlue
            text[range].font = .custom("DM Sans", size: 9).weight(.medium)
        }

        if let range = text.range(of: "Privacy Policy") {
            text[range].foregroundColor = .themeBlue
            text[range].font = .custom("DM Sans", size: 9).weight(.medium)
        }

        return text
    }
}
