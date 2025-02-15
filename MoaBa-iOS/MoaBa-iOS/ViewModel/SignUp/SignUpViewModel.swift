import Foundation
import Alamofire

class SignUpViewModel: ObservableObject {
    @Published var model = SignUpRequest()
    
    func signUp() {
        AF.request("https://highthon10-api.imseo.dev/auth/sign-up", method: .post, parameters: model.params, encoding: JSONEncoding.default)
            .responseJSON { json in
                print(json)
            }
    }
}
