import SwiftUI

struct FansChatView: View {
    let firstChat: String
    @State var text: String = ""

    init(firstChat: String) {
        self.firstChat = firstChat
    }

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 0) {
                    otherChatCell(content: firstChat)
                    ForEach(0..<5, id: \.self) { _ in
                        otherChatCell(content: "hello")
                    }
                    myChatCell(content: "안녕하세요")
                    myChatCell(content: "반갑습니다")
                    myChatCell(content: "여러분")
                    ForEach(0..<5, id: \.self) { _ in
                        otherChatCell(content: "bye")
                    }
                    ForEach(0..<5, id: \.self) { _ in
                        myChatCell(content: "ㅎㅇㅎㅇㅎㅇ")
                    }
                }
            }

            comment("메시지 입력", text: $text)
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
                .padding(.bottom, 4)
        }
        .navigationBar(title: "돌아가기")
    }

    @ViewBuilder
    func comment(_ placeholder: String, text: Binding<String>) -> some View {
        HStack(spacing: 0) {
            Group {
                if text.wrappedValue.isEmpty {
                    Text(placeholder)
                } else {
                    TextField("", text: text)
                }
            }
            .mbFont(size: 14, weight: .medium, color: .MoaBa.darkGray)

            Spacer()
            
            Image(.send)
                .resizable()
                .frame(width: 35, height: 35)
        }
        .padding(.horizontal, 16)
        .withBorder(cornerRadius: 30, borderColor: .MoaBa.purple)
    }

    @ViewBuilder
    func otherChatCell(content: String) -> some View {
        HStack(spacing: 10) {
            Image("baseProfile")
                .resizable()
                .frame(width: 40, height: 40)

            VStack(alignment: .leading, spacing: 4) {
                Text("팬")
                    .mbFont(size: 12, weight: .medium, color: .black)

                HStack(spacing: 10) {
                    Text(content)
                        .mbFont(size: 14, weight: .medium, color: .black)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(.white)
                        .withBorder(cornerRadius: 10, borderColor: .black.opacity(0.2))
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }

    @ViewBuilder
    func myChatCell(content: String) -> some View {
        Text(content)
            .mbFont(size: 14, weight: .medium, color: .black)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.MoaBa.lightPurple)
            .cornerRadius(10)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.vertical, 8)
    }
}

#Preview {
    FansChatView(firstChat: "다들 방갑습니다")
}
