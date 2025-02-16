import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                notiHeader()

                favoriteProfile()
                
                if !viewModel.imgUrlList.isEmpty {
                    photos(urls: viewModel.imgUrlList)
                } else {
                    ProgressView()
                }
            }
        }
        .onAppear {
            viewModel.getPhotos()
        }
        
    }
    
    @ViewBuilder
    func photos(urls: [String]) -> some View {
        ForEach(urls, id: \.self) { url in
            VStack(alignment: .leading) {
                HStack {
                    Image("baseProfile")
                        .resizable()
                        .frame(width: 40, height: 40)
                    
                    Text("저스디스")
                        .mbFont(size: 14, weight: .semiBold, color: .black)
                }
                .padding()
                
                AsyncImage(url: URL(string: url)) { phase in
                    if let image = phase.image {
                        image.resizable().scaledToFit()
                    } else {
                        Color.gray.opacity(0.3)
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
    }


    @ViewBuilder
    func favoriteProfile() -> some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: .init(string: "https://i.namu.wiki/i/vq8CrzSPgOneFkKpBZx86kx2uBGYqDV7XjhjlKJm_hQpp0IYCVpGqI9U00wNo6eCkSiFyXrrce3e-qDwsuPX7A.webp")) {
                $0.image?.resizable()
            }
            .aspectRatio(contentMode: .fit)

            Color.black.opacity(0.3)

            VStack(spacing: 4) {
                Text("저스디스")
                    .mbFont(size: 36, weight: .semiBold, color: .white)
                Text("GROOVL1N")
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
                    Text("🎁셀카 포토카드 증정 이벤트📸")
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
