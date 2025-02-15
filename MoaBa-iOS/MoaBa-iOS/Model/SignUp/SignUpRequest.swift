import Foundation

struct SignUpRequest: Codable {
    var email: String = ""
    var username: String = ""
    var password: String = ""
    var confirm_password: String = ""
    
    var params: [String: Any] {
        return [
            "email": email,
            "username": username,
            "password": password,
            "confirm_password": confirm_password
        ]
    }
}
