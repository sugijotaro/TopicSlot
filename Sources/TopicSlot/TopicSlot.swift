import SwiftUI

public struct TopicSlotApp: View {
    @State private var currentTopic: String = "Tap to Spin"
    // このクロージャを介して親アプリに結果を伝えることも可能
    public var onTopicSelected: ((String) -> Void)?

    private let topics = [
        String(localized: "Favorite Food"),
        String(localized: "Recent Travel"),
        String(localized: "Hobbies"),
        String(localized: "Childhood Dream"),
        String(localized: "Favorite Movie"),
        String(localized: "Weekend Plans"),
        String(localized: "Recommended Books"),
        String(localized: "Music"),
        String(localized: "Sports"),
        String(localized: "Tech Trends")
    ]

    public init(onTopicSelected: ((String) -> Void)? = nil) {
        self.onTopicSelected = onTopicSelected
    }

    public var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("Topic")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(currentTopic)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                    )

                Button(action: {
                    spinTopic()
                }) {
                    HStack {
                        Image(systemName: "arrow.triangle.2.circlepath")
                        Text("Spin Topic")
                    }
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal)
        }
    }

    private func spinTopic() {
        let availableTopics = topics.filter { $0 != currentTopic }
        if let randomTopic = availableTopics.randomElement() {
            withAnimation(.spring()) {
                currentTopic = randomTopic
            }
            onTopicSelected?(randomTopic)
        }
    }
}

#Preview {
    TopicSlotApp()
}
