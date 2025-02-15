import Foundation

struct SignInResponse: Codable {
    let body: Body
    let header: Header
}

struct Body: Codable {
    let token: String
}

struct Header: Codable {
    let message: String
    let result: String
}
