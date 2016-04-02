
import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class RestClient<T: Mappable> {
    typealias CompletionHandler = (result: Result<T>) -> Void
    private let request:(method: Alamofire.Method, movieName: String, params: [String: AnyObject]?, completionHandler: CompletionHandler) -> Void = { method, movieName, params, completionHandler in
        
        Alamofire.request(method, Constants.WS.URL + movieName, parameters: params)
            .validate()
            .responseObject() { (response: Response<T, NSError>) in
                if response.result.isSuccess {
                    completionHandler(result: Result<T>.Success(output: response.result.value!))
                } else {
                    completionHandler(result: Result<T>.Failure(error: response.result.error!))
                }
        }
    }
    
  func get(movieName: String, params: [String: AnyObject]?, completionHandler: CompletionHandler) {
        request(method: .GET, movieName: movieName, params: params, completionHandler: completionHandler)
    }
}

enum Result<U> {
  case Success(output: U)
  case Failure(error: NSError)
}