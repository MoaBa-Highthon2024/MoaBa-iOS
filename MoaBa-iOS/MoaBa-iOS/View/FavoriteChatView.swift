import SwiftUI

struct FavoriteChatView: View {
    @State var isMoved = false
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                header()

                chatCell(content: "안녕하세요")
                chatCell(content: "저는 페이커 대상혁입니다")
                chatCell(content: "하이톤은 어떠신가요?")
                chatCell(content: "화이팅 하세요")
                chatCell(content: "ㅋㅋㅋㅋ")
            }
        }
        .navigationDestination(isPresented: $isMoved) {
            FansChatView(firstChat: "firstChat")
        }
    }

    @ViewBuilder
    func header() -> some View {
        Text("최애 채팅")
            .mbFont(size: 32, weight: .semiBold, color: .black)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    @ViewBuilder
    func chatCell(content: String) -> some View {
        HStack(spacing: 10) {
            Image("baseProfile")
                .resizable()
                .frame(width: 40, height: 40)

            VStack(alignment: .leading, spacing: 4) {
                Text("Faker")
                    .mbFont(size: 12, weight: .medium, color: .black)

                HStack(spacing: 10) {
                    Text(content)
                        .mbFont(size: 14, weight: .medium, color: .black)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(.white)
                        .withBorder(cornerRadius: 10, borderColor: .black.opacity(0.2))

                    Button {
                        self.isMoved = true
                    } label: {
                        Image(.reply)
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}

#Preview {
    FavoriteChatView()
}
