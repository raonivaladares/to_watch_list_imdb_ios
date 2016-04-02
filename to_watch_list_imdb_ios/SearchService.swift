
import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class SearchService {
    static let instance = SearchService()
    
    private let restClient: RestClient<Movie>
    
    init(restClient: RestClient<Movie> = RestClient()) {
        self.restClient = restClient
    }
    
  func searchMovie(movieName: String, completionHandler: (result: Result<Movie>) -> Void){
        restClient.get(movieName, params: nil, completionHandler: completionHandler)
    }
}