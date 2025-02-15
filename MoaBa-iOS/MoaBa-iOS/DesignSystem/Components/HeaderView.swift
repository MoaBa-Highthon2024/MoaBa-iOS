import SwiftUI

struct HeaderView: View {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .mbFont(size: 20, weight: .semiBold)
            .padding(.init(top: 10, leading: 16, bottom: 23, trailing: 0))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
