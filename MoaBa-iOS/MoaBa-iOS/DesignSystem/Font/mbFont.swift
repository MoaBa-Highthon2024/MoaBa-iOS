import SwiftUI

enum FontWeight: String {
    case bold = "Bold"
    case semiBold = "SemiBold"
    case medium = "Medium"
}

private struct MBFont: ViewModifier {
    private let size: CGFloat
    private let weight: FontWeight

    init(size: CGFloat, weight: FontWeight) {
        self.size = size
        self.weight = weight
    }

    func body(content: Content) -> some View {
        content
            .font(.custom("NotoSansKR-\(weight.rawValue)", size: size))
//            .lineSpacing(style.lineHeight - lineHeight)
//            .padding(.vertical, (style.lineHeight - lineHeight) / 4)
    }
}

extension View {
    func mbFont(size: CGFloat, weight: FontWeight) -> some View {
        self
            .modifier(MBFont(size: size, weight: weight))
    }

    func mbFont(size: CGFloat, weight: FontWeight, color: Color) -> some View {
        self
            .mbFont(size: size, weight: weight)
            .foregroundColor(color)
    }
}
