import Foundation

struct GalleryResponse: Decodable {
    let body: [ImageItem]
    let header: Header
}

struct ImageItem: Decodable {
    let imgUrl: String
    
    enum CodingKeys: String, CodingKey {
        case imgUrl = "img_url"
    }
}
