import Foundation
import SwiftUI
import Alamofire

class SignInViewModel: ObservableObject {
    @Published var model: SignInRequest = SignInRequest()
    @Published var isSuccessSignin = false
    
    func signIn() {                
        AF.request("https://highthon10-api.imseo.dev/auth/sign-in",
                   method: .post,
                   parameters: self.model.params,
                   encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let jsonResponse):
                    if let data = jsonResponse as? [String: Any],
                       let header = data["header"] as? [String: Any],
                       let body = data["body"] as? [String: Any],
                       let token = body["token"] as? String {
                        if MBUserDefault.create(token: token) {
                            print("KeyChain 저장 성공")
                            self.isSuccessSignin = true
                        } else {
                            print("KeyChain 저장 실패")
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
