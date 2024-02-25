import Foundation
import Alamofire

class APIFetchHandler {
    static let sharedInstance = APIFetchHandler()
    
    func fetchAPIData(query: String) {
        let url = "https://trackapi.nutritionix.com/v2/natural/nutrients"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "x-app-id": "91af72c6",
            "x-app-key": "ad4374f410968b81385dbc084ca9e451"
        ]

        let parameters: [String: Any] = [
            "query" : query,
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers, interceptor: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    print("Raw JSON data: \(data)")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
