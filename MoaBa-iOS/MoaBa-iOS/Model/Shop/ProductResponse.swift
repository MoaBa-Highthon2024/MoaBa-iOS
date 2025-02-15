import Foundation

struct ProductResponse: Decodable {
    let body: [Item]
    let header: Header
}

struct Item: Decodable {
    let body: String
    let idx: Int
    let img: String
    let price: Int
    let title: String
}
