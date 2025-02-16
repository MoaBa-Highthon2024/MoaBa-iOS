import Foundation

struct JustResponse: Decodable {
    let header: Header
}

struct JustRequest: Encodable {
    let token: String
    init() {
        self.token = MBUserDefault.read() ?? ""
    }

    var params: [String: Any] {
        ["session_token": "43b2cefcabbb1bae5f3d6d534abd74ef"]
    }
}
struct Response<Body: Decodable>: Decodable {
    let body: Body
    let header: Header
}

struct Header: Decodable {
    let message: String
    let result: String
}
