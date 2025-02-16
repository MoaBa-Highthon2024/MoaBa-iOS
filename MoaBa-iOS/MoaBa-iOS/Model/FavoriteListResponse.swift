import Foundation

struct FavoriteListResponse: Decodable, Identifiable {
    var id: Int { idx }
    
    let idx: Int
    let profile_img: String
    let title: String
}
//### `idx` · int
//
//최애의 고유 번호. 추후 API를 호출할 때 사용됩니다.
//
//### `title` · string
//
//인물/그룹 명.
//
//### `profile_img` · string
//
//대표 이미지 주소.
