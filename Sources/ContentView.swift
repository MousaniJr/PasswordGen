import SwiftUI

struct ContentView: View {
    @State private var generatedPassword: String = ""
    @State private var showCopiedMessage: Bool = false
    @State private var passwordHistory: [String] = []

    private let generator = PasswordGenerator()

    var body: some View {
        VStack(spacing: 25) {
            // Title
            Text("Password Generator")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.primary)

            // Description
            Text("Generate secure passwords using color + word combinations")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            // Generated Password Display
            VStack(spacing: 12) {
                if !generatedPassword.isEmpty {
                    HStack {
                        Text(generatedPassword)
                            .font(.system(size: 24, weight: .semibold, design: .monospaced))
                            .foregroundColor(.blue)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue.opacity(0.1))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue.opacity(0.3), lineWidth: 2)
                            )

                        Button(action: copyToClipboard) {
                            Image(systemName: "doc.on.doc")
                                .font(.system(size: 20))
                        }
                        .buttonStyle(.plain)
                        .help("Copy to clipboard")
                    }

                    if showCopiedMessage {
                        Text("Copied to clipboard!")
                            .font(.caption)
                            .foregroundColor(.green)
                            .transition(.opacity)
                    }
                }
            }
            .frame(height: 100)

            // Generate Button
            Button(action: generateNewPassword) {
                HStack {
                    Image(systemName: "arrow.clockwise")
                        .font(.system(size: 16, weight: .semibold))
                    Text(generatedPassword.isEmpty ? "Generate Password" : "Generate New Password")
                        .font(.system(size: 16, weight: .semibold))
                }
                .foregroundColor(.white)
                .padding(.horizontal, 30)
                .padding(.vertical, 12)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(10)
            }
            .buttonStyle(.plain)
            .shadow(color: .blue.opacity(0.3), radius: 5, x: 0, y: 2)

            // Password History
            if !passwordHistory.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Recent Passwords")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    ScrollView {
                        VStack(spacing: 6) {
                            ForEach(passwordHistory, id: \.self) { password in
                                HStack {
                                    Text(password)
                                        .font(.system(.body, design: .monospaced))
                                        .foregroundColor(.primary)
                                    Spacer()
                                    Button(action: {
                                        copyPasswordToClipboard(password)
                                    }) {
                                        Image(systemName: "doc.on.doc")
                                            .font(.system(size: 12))
                                            .foregroundColor(.secondary)
                                    }
                                    .buttonStyle(.plain)
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(6)
                            }
                        }
                    }
                    .frame(maxHeight: 150)
                }
                .padding(.top, 10)
            }
        }
        .padding(30)
        .frame(width: 500)
        .onAppear {
            generateNewPassword()
        }
    }

    private func generateNewPassword() {
        generatedPassword = generator.generatePassword()

        // Add to history (keep last 5)
        passwordHistory.insert(generatedPassword, at: 0)
        if passwordHistory.count > 5 {
            passwordHistory.removeLast()
        }

        // Reset copied message
        showCopiedMessage = false
    }

    private func copyToClipboard() {
        copyPasswordToClipboard(generatedPassword)
    }

    private func copyPasswordToClipboard(_ password: String) {
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(password, forType: .string)

        // Show copied message
        withAnimation {
            showCopiedMessage = true
        }

        // Hide message after 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                showCopiedMessage = false
            }
        }
    }
}

#Preview {
    ContentView()
}
