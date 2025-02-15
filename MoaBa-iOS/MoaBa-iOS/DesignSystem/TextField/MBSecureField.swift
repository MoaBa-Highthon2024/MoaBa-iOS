import SwiftUI

public struct MBSecureField: View {
    @State var isSecured: Bool = true
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
            HStack(spacing: 8) {
                ZStack(alignment: .leading) {
                    Text(placeholder)
                        .mbFont(size: 14, weight: .medium, color: .MoaBa.lightGray)
                        .opacity(text.isEmpty ? 1 : 0)

                    Group {
                        if self.isSecured {
                            SecureField("", text: $text)
                        } else {
                            TextField("", text: $text)
                        }
                    }
                    .mbFont(size: 14, weight: .medium, color: .black)
                    .onSubmit(onCommit)
                }

                Image(systemName: isSecured ? "eye.slash" : "eye")
                    .resizable()
                    .frame(width: 25, height: 19)
                    .foregroundStyle(Color.MoaBa.gray)
                    .onTapGesture {
                        isSecured.toggle()
                    }
            }
            .padding(.horizontal, 16)
            .frame(height: 48)
            .background(.white)
            .withBorder(
                cornerRadius: 13,
                borderColor: .MoaBa.lightGray
            )
        }
        .textInputAutocapitalization(.never)
    }
}
