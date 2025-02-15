import SwiftUI

enum ButtonStyle {
    case main
    case sub

    var backgroundColor: Color {
        switch self {
        case .main:
            Color.MoaBa.purple
        case .sub:
            Color.MoaBa.grayPurple
        }
    }
}

struct MBButton: View {
    let text: String
    let type: ButtonStyle
    let action: () -> Void

    init(text: String, type: ButtonStyle = .main, action: @escaping () -> Void) {
        self.text = text
        self.type = type
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Text(text)
                .mbFont(size: 16, weight: .medium, color: .white)
                .frame(maxWidth: .infinity, maxHeight: 52)
                .background(type.backgroundColor)
                .cornerRadius(13)
        }
    }
}
