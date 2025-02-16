import SwiftUI

let dummyFakerProfile = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqHR7cuRDBy4bIzFSjRTxBLLhdHAELx2U2vA&s"

struct SelectFavoriteView: View {
    @State var favoriteList: [FavoriteListResponse] = []
    @State var isPresented: Bool = false
    @State var isNavigated: Bool = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    ZStack {
                        Color.MoaBa.lightPurple

                        Image(.appLogo)
                            .resizable()
                            .scaledToFit()
                            .padding(.vertical)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 280)

                    header()

                    if favoriteList.isEmpty {
                        Text("나의 최애를 추가해주세요!")
                            .mbFont(size: 12, weight: .medium, color: .black)
                            .frame(maxWidth: .infinity)
                            .padding(16)
                    } else {
                        LazyVGrid(columns: [.init(), .init(), .init()]) {
                            ForEach(favoriteList) { list in
                                favoriteCell(model: list)
                            }
                        }
                    }
                }
            }
            .fullScreenCover(isPresented: $isPresented) {
                MainTabView()
            }
            .navigationDestination(isPresented: $isNavigated) {
                SetFavoriteView { model in
                    self.favoriteList.append(model)
                    self.isNavigated = false
                }
            }
        }
    }

    @ViewBuilder
    func header() -> some View {
        HStack {
            Text("나의 최애")
                .mbFont(size: 20, weight: .semiBold)
            
            Spacer()
            
            Button {
                self.isNavigated = true
            } label: {
                Image(systemName: "plus")
                    .tint(.black)
            }
        }
        .padding(.init(top: 10, leading: 16, bottom: 23, trailing: 16))
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    @ViewBuilder
    func favoriteCell(model: FavoriteListResponse) -> some View {
        Button {
            self.isPresented = true
        } label: {
            VStack(spacing: 8) {
                AsyncImage(url: .init(string: model.profile_img)) {
                    $0.image?.resizable()
                }
                .aspectRatio(1, contentMode: .fill)
                .frame(width: 100, height: 100)
                .background(.lightGray)
                .overlay {
                    Circle().stroke(Color.MoaBa.lightGray, lineWidth: 1)
                }
                .clipShape(Circle())

                Text(model.title)
                    .mbFont(size: 16, weight: .medium, color: .black)
            }
            .frame(width: 100)
        }
    }
}

#Preview {
    SelectFavoriteView()
}
