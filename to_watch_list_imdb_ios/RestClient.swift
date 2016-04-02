
import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class RestClient<T: Mappable> {
    
    typealias CompletionHandler = (result: Result<T>) -> Void
    private let resource: String
    private let request:(method: Alamofire.Method, resource: String, params: [String: AnyObject]?, completionHandler: CompletionHandler) -> Void = { method, resource, params, completionHandler in
        
        Alamofire.request(method, Constants.WS.URL+resource, parameters: params)
            .validate()
            .responseObject() { (response: Response<T, NSError>) in
                if response.result.isSuccess {
                    completionHandler(result: Result<T>.Success(output: response.result.value!))
                } else {
                    completionHandler(result: Result<T>.Failure(error: response.result.error!))
                }
        }
    }
    
    init(resource: String) {
        self.resource = resource
    }
    
    func get(params: [String: AnyObject]?, completionHandler: CompletionHandler) {
        request(method: .GET, resource: resource, params: params, completionHandler: completionHandler)
    }
}

enum Result<U> {
  case Success(output: U)
  case Failure(error: NSError)
}