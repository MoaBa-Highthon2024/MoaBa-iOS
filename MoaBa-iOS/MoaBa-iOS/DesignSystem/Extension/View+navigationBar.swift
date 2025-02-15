import SwiftUI

struct NavigationBarModifier: ViewModifier {
    @Environment(\.dismiss) var dismiss
    let title: String

    init(
        title: String = ""
    ) {
        self.title = title
    }

    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button {
                    dismiss()
                } label: {
                    Image(.backArrow)
                        .resizable()
                        .frame(width: 24, height: 24)
                }

                Text(title)
                    .mbFont(size: 16, weight: .medium, color: .black)
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, alignment: .leading)

            content.frame(maxHeight: .infinity)
        }
        .navigationBarBackButtonHidden()
    }
}

extension View {
    func navigationBar(
        title: String = ""
    ) -> some View {
        modifier(NavigationBarModifier(title: title))
    }
}

// SwipeGesture로 뒤로갈 수 있게 하는 extension
extension UINavigationController: ObservableObject, UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
