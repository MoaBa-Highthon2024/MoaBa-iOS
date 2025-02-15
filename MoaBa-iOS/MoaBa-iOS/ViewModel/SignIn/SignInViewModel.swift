import Foundation
import SwiftUI
import Alamofire

class SignInViewModel: ObservableObject {
    @Published var model: SignInRequest = SignInRequest()
    
    func signIn() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                      let window = windowScene.windows.first,
              let viewController = window.rootViewController else {return}
                
        let nextVC = UIHostingController(rootView: NavigationView { Text("메인") })
                nextVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                
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
                        if KeyChain.create(token: token) {
                            print("KeyChain 저장 성공")
                            DispatchQueue.main.async {
                                viewController.present(nextVC, animated: true)
                            }
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
