
import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class SearchService {
    
    static let RESOURCE = "/lalala"
    static let instance = SearchService()
    
    private let restClient: RestClient<Movie>
    
    init(restClient: RestClient<Movie> = RestClient(resource: RESOURCE)) {
        self.restClient = restClient
    }
    
    func searchMovie(completionHandler: (result: Result<Movie>) -> Void){
        restClient.get(nil, completionHandler: completionHandler)
    }
}