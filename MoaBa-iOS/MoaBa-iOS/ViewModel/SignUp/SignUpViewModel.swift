import Foundation
import Alamofire

class SignUpViewModel: ObservableObject {
    @Published var isSuccessSignin = false
    @Published var model = SignUpRequest()
    
    func signUp() {
        AF.request("https://highthon10-api.imseo.dev/auth/sign-up", method: .post, parameters: model.params, encoding: JSONEncoding.default)
            .response { data in
                switch data.result {
                case .success(let jsonResponse):
                    guard let data = jsonResponse else { return }
                    print(data)
                    guard let response = try? JSONDecoder().decode(JustResponse.self, from: data) else { print("error"); return }
                    self.signIn()
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }

    func signIn() {
        let signinModel = SignInRequest.init(email: self.model.email, password: self.model.password)
        AF.request("https://highthon10-api.imseo.dev/auth/sign-in",
                   method: .post,
                   parameters: signinModel.params,
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
