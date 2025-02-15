import SwiftUI

public struct MBTextField: View {
    var placeholder: String
    @Binding var text: String
    var onCommit: () -> Void

    public init(
        _ placeholder: String = "",
        text: Binding<String>,
        onCommit: @escaping () -> Void = {}
    ) {
        self.placeholder = placeholder
        _text = text
        self.onCommit = onCommit
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            ZStack(alignment: .leading) {
                Text(placeholder)
                    .mbFont(size: 14, weight: .medium, color: .black)
                    .opacity(text.isEmpty ? 1 : 0)

                TextField("", text: $text)
                    .mbFont(size: 14, weight: .medium, color: .MoaBa.lightGray)
                    .onSubmit(onCommit)
            }
            .padding(.horizontal, 16)
            .frame(height: 48)
            .background(.white)
            .withBorder(
                cornerRadius: 13,
                borderColor: .MoaBa.lightGray
            )
        }
    }
}
