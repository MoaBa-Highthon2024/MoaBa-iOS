import Foundation

struct JustResponse: Codable {
    let header: Header
}

struct Response<Body: Codable>: Codable {
    let body: Body
    let header: Header
}

struct SignInResponse: Codable {
    let token: String
}

struct Header: Codable {
    let message: String
    let result: String
}
