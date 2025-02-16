import Foundation
import Alamofire

class HomeViewModel: ObservableObject {
    @Published var imgUrlList: [String] = []
    
    func getPhotos() {
        AF.request("https://highthon10-api.imseo.dev/gallery/2", method: .get)
            .responseDecodable(of: GalleryResponse.self) { response in
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.imgUrlList = data.body.map { $0.imgUrl }
                    }
                    print("이미지 불러오기 성공")
                    
                case .failure(let error):
                    print("이미지 불러오기 실패", error.localizedDescription)
                }
            }
    }
}
