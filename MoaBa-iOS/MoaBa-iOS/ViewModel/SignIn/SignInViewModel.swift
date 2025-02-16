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
            .responseJSON { json in
                print(json)
            }
            .response { response in
                switch response.result {
                case .success(let data):
                    if let data,
                       let token = try? JSONDecoder().decode(Response<SignInResponse>.self, from: data) {
                        print(token)
                        if MBUserDefault.create(token: token.body.token) {
                            print("token")
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
