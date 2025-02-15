import SwiftUI

struct MBButton: View {
    let text: String
    let action: () -> Void

    init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Text(text)
                .mbFont(size: 16, weight: .medium, color: .white)
                .frame(maxWidth: .infinity, maxHeight: 52)
        }
    }
}
