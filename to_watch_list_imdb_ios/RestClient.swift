
import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class RestClient<T: Mappable> {
    typealias CompletionHandler = (result: Result<T>) -> Void
    private let request:(method: Alamofire.Method, movieTitle: String, params: [String: AnyObject]?, completionHandler: CompletionHandler) -> Void = { method, movieTitle, params, completionHandler in
      
      let scapedTitle = "\(movieTitle)".stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())!
        Alamofire.request(method, Constants.WS.URL + scapedTitle, parameters: params)
            .validate()
            .responseObject() { (response: Response<T, NSError>) in
                if response.result.isSuccess {
                    completionHandler(result: Result<T>.Success(output: response.result.value!))
                } else {
                    completionHandler(result: Result<T>.Failure(error: response.result.error!))
                }
        }
    }
    
  func get(movieTitle: String, params: [String: AnyObject]?, completionHandler: CompletionHandler) {
        request(method: .GET, movieTitle: movieTitle, params: params, completionHandler: completionHandler)
    }
}

enum Result<U> {
  case Success(output: U)
  case Failure(error: NSError)
}