import SwiftUI

let dummyFakerProfile = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqHR7cuRDBy4bIzFSjRTxBLLhdHAELx2U2vA&s"

struct SelectFavoriteView: View {
    @State var isPresented: Bool = false
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Color.green
                    .frame(maxWidth: .infinity)
                    .frame(height: 280)

                HeaderView("나의 최애")

                VStack(spacing: 24) {
                    favoriteCellGrid()

                    favoriteCellGrid()
                }
            }
        }
        .fullScreenCover(isPresented: $isPresented) {
            MainTabView()
        }
    }

    @ViewBuilder
    func favoriteCellGrid() -> some View {
        HStack(spacing: 0) {
            favoriteCell()
            Spacer()
            favoriteCell()
            Spacer()
            favoriteCell()
        }
        .padding(.horizontal, 16)
    }

    @ViewBuilder
    func favoriteCell() -> some View {
        Button {
            self.isPresented = true
        } label: {
            VStack(spacing: 8) {
                AsyncImage(url: .init(string: dummyFakerProfile)) {
                    $0.image?.resizable()
                }
                .aspectRatio(1, contentMode: .fill)
                .frame(width: 100, height: 100)
                .background(.lightGray)
                .overlay {
                    Circle().stroke(Color.MoaBa.lightGray, lineWidth: 1)
                }
                .clipShape(Circle())

                Text("Faker")
                    .mbFont(size: 16, weight: .medium, color: .black)
            }
            .frame(width: 100)
        }
    }
}

#Preview {
    SelectFavoriteView()
}
