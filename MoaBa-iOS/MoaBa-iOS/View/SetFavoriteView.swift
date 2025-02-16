import SwiftUI
import Alamofire

enum MBCategory: String, CaseIterable {
    case all
    case musician
    case athlete
    case actor
    case comedian
    case youtuber
    case etc

    var tag: String {
        switch self {
        case .all:
            "All"
        case .musician:
            "뮤지션"
        case .athlete:
            "운동 선수"
        case .actor:
            "배우"
        case .comedian:
            "코미디언"
        case .youtuber:
            "유튜버"
        case .etc:
            "기타"
        }
    }
}

struct SetFavoriteView: View {
    @State var selectedItem: FavoriteListResponse? = nil
    @State var selectedTag = MBCategory.all
    @State var search: String = ""
    var url: String {
        "https://highthon10-api.imseo.dev/favorites/search/\(selectedTag.rawValue)/\(search)"
    }
    let tagList: [MBCategory] = MBCategory.allCases
    @State var favoriteList: [FavoriteListResponse] = .init()
    let selectAction: (FavoriteListResponse) -> Void

    func getFavoriteList(url: String) {
        print(url)
        AF.request(
            url,
            method: .post,
            parameters: JustRequest().params,
            encoding: JSONEncoding.default
        )
        .validate()
        .responseJSON { json in
            print(json)
        }
        .response { response in
            switch response.result {
            case .success(let data):
                if let data,
                   let response = try? JSONDecoder().decode(Response<[FavoriteListResponse]>.self, from: data) {
                    print(response)
                    self.favoriteList = response.body
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func setFavorite(idx: Int) {
        var param = JustRequest().params
        param["idx"] = idx
        AF.request(
            "https://highthon10-api.imseo.dev/favorites/be-fan",
            method: .post,
            parameters: param,
            encoding: JSONEncoding.default
        )
        .validate()
        .responseJSON { json in
            print(json)
        }
        .response { response in
            switch response.result {
            case .success(let data):
                if let data,
                   let response = try? JSONDecoder().decode(Response<[FavoriteListResponse]>.self, from: data) {
                    print(response)
                    self.favoriteList = response.body
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    var body: some View {
        VStack(spacing: 10) {
            search("최애를 검색해주세요.", text: $search)
                .padding(.horizontal, 16)

            ScrollView(.horizontal) {
                HStack(spacing: 6) {
                    ForEach(tagList, id: \.self) { tag in
                        tagCell(text: tag.tag, isSelected: tag == selectedTag)
                            .onTapGesture {
                                selectedTag = tag
                            }
                    }
                }
            }
            .padding(.horizontal, 16)
            ScrollView {
                LazyVGrid(columns: [.init(), .init(), .init()]) {
                    ForEach(favoriteList) { list in
                        favoriteCell(list)
                    }
                }
            }
        }
        .onAppear {
            getFavoriteList(url: self.url)
        }
        .onChange(of: url) { _, newURL in
            getFavoriteList(url: newURL)
        }
        .navigationBar(title: "뒤로가기")
    }

    @ViewBuilder
    func favoriteCell(_ model: FavoriteListResponse) -> some View {
        Button {
            self.selectedItem = model
            selectAction(model)
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

    @ViewBuilder
    func search(_ placeholder: String, text: Binding<String>) -> some View {
        HStack(spacing: 0) {
            ZStack(alignment: .leading) {
                Group {
                    Text(placeholder)
                        .opacity(text.wrappedValue.isEmpty ? 1 : 0)
                    
                    TextField("", text: text)
                }
                .mbFont(size: 14, weight: .medium, color: .MoaBa.darkGray)
            }

            Spacer()
            
            Image(.searchIcon)
                .resizable()
                .frame(width: 35, height: 35)
        }
        .frame(height: 40)
        .padding(.leading, 16)
        .padding(.trailing, 4)
        .withBorder(cornerRadius: 8, borderColor: .MoaBa.purple)
    }

    @ViewBuilder
    func tagCell(text: String, isSelected: Bool) -> some View {
        Text(text)
            .mbFont(size: 14, weight: .medium, color: .black)
            .padding(.vertical, 4)
            .padding(.horizontal, 10)
            .background(isSelected ? Color.MoaBa.lightPurple : .white)
            .withBorder(cornerRadius: 5, borderColor: Color.MoaBa.lightGray.opacity(isSelected ? 0 : 1))
    }
}

#Preview {
    SetFavoriteView { _ in }
}
