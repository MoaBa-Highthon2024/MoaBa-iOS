import Foundation
import Alamofire

class ShopViewModel: ObservableObject {
    @Published var productResponses: [Item] = []
    
    func getProducts() {
        AF.request("https://highthon10-api.imseo.dev/shop", method: .get)
            .validate()
            .responseDecodable(of: ProductResponse.self) { response in
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.productResponses = data.body // 응답의 body 값을 리스트에 저장
                    }
                    print("상품 목록 불러오기 성공")
                    
                case .failure(let error):
                    print("상품 불러오기 실패", error.localizedDescription)
                }
            }
    }
}
