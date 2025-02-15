import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                notiHeader()

                favoriteProfile()
            }
        }
    }

    @ViewBuilder
    func favoriteProfile() -> some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: .init(string: dummyFakerProfile)) {
                $0.image?.resizable()
            }
            .aspectRatio(contentMode: .fit)

            Color.black.opacity(0.3)

            VStack(spacing: 4) {
                Text("이상혁")
                    .mbFont(size: 36, weight: .semiBold, color: .white)
                Text("SKT T1")
                    .mbFont(size: 24, weight: .medium, color: .white)
            }
            .padding(.bottom, 14)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 340)
    }

    @ViewBuilder
    func notiHeader() -> some View {
        HStack {
            HStack(spacing: 10) {
                Image(.meagphone)
                    .resizable()
                    .frame(width: 24, height: 24)

                VStack(alignment: .leading, spacing: 0) {
                    Text("공지사항")
                        .mbFont(size: 14, weight: .semiBold, color: .black)
                    Text("🎁[아라치 X '페이커'] 셀카 포토카드 증정 이벤트📸")
                        .mbFont(size: 12, weight: .medium, color: .black)
                }
            }

            Spacer()

            Image(.rightArrow)
                .resizable()
                .frame(width: 24, height: 24)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }
}

#Preview {
    HomeView()
}
